#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <sys/socket.h>
#include <arpa/inet.h>
#include <netinet/in.h>
#include <unistd.h>
#include <netdb.h>

char dns_servers[1][16];
int dns_server_count = 0;

#define A 1
#define NS 2
#define CNAME 5
#define DEFAULT_SERVER "119.29.29.29"
void ngethostbyname(unsigned char*,int);
void ChangetoDnsNameFormat(unsigned char*,unsigned char*);
void ParseDnsName(unsigned char*buf,unsigned char*reader,char *out,int *len);
int isPointer(int in);

struct DNS_HEADER{
	unsigned short id;
	unsigned char rd :1;//递归
	unsigned char tc :1;//可截断
	unsigned char aa :1;//授权回答
	unsigned char opcode :4;
	unsigned char qr :1;//查询0/响应1
	unsigned char rcode :4;//应答码
	unsigned char cd :1;
	unsigned char ad :1;
	unsigned char z :1;//保留值
	unsigned char ra :1;//可用递归
	unsigned short q_count;//查询问题域的数量
	unsigned short ans_count;//回答区域的数量
	unsigned short auth_count;//授权区域的数量
	unsigned short add_count;//附加区域的数量
};

struct QUESTION{
	unsigned short qtype;//查询类型
	unsigned short qclass;//查询类
};

typedef struct{
	unsigned char *name;
	struct QUESTION *ques;
} QUERY;

#pragma pack(push,1)
struct R_DATA{
	unsigned short type;//资源记录类型
	unsigned short _class;//类
	unsigned int ttl;//资源记录缓存时间
	unsigned short data_len;//数据长度
};
#pragma pack(pop)

struct RES_RECORD{
	unsigned char *name;//资源记录包含的域名
	struct R_DATA *resource;//资源数据
	unsigned char *rdata;
};

int main(int argc,unsigned char *argv[]){
	if(argc == 1){
		printf("请输入一个域名！\n");
		exit(1);
	}

	unsigned char hostname[100];
	unsigned char dns_servername[100];
	int arg_num;
	char arg_list[argc];
	for(int i = 1;i < argc;i++)
		arg_list[i] = 'f';
	char trace = 'f';
	char serv = 'f';
	int query_type = A;
	for(arg_num = 1;arg_num < argc;arg_num++){
		if(argv[arg_num][0] == '@'){
			serv = 't';
			strcpy(dns_servername,argv[arg_num]);
			strcpy(dns_servers[0],dns_servername + 1);
			arg_list[arg_num] = 't';
			continue;
		}
		else if(!strcmp(argv[arg_num],"+trace")){
			trace = 't';
			arg_list[arg_num] = 't';
			continue;
		}
		else if(!strcmp(argv[arg_num],"ns")){
			query_type = NS;
			arg_list[arg_num] = 't';
			continue;
		}
		else
			continue;
	}
	for(arg_num = 1;arg_num < argc;arg_num++){
		if(arg_list[arg_num] == 'f'){
			char err = 'f';
			for(int search = arg_num + 1;search < argc;search++){
				if(arg_list[search] == 'f'){
					err = 't';
					break;
				}
			}
			if(err == 't'){
				printf("参数错误！\n");
				exit(1);
			}
			else{
				strcpy(hostname,argv[arg_num]);
				break;
			}
		}
	}

	if(serv == 'f'){
		strcpy(dns_servername,DEFAULT_SERVER);
		strcpy(dns_servers[0],dns_servername);
	}
	ngethostbyname(hostname,query_type);
	return 0;
}

void ngethostbyname(unsigned char host[],int query_type){
	unsigned char buf[65536],*qname,*reader;
	int i,j,stop,s;
	struct sockaddr_in a;
	struct RES_RECORD answers[20],auth[20],addit[20];
	struct sockaddr_in dest;

	struct DNS_HEADER *dns = NULL;
	struct QUESTION *qinfo = NULL;

	
	printf("\n解析域名:%s",host);

	s = socket(AF_INET,SOCK_DGRAM,IPPROTO_UDP);

	dest.sin_family = AF_INET;
	dest.sin_port = htons(53);
	dest.sin_addr.s_addr = inet_addr(dns_servers[0]);

	dns = (struct DNS_HEADER*)&buf;

	dns->id = (unsigned short)htons(getpid());
	dns->qr = 0;
	dns->opcode = 0;
	dns->aa = 0;
	dns->tc = 0;
	dns->rd = 1;
	dns->ra = 0;
	dns->z = 0;
	dns->ad = 0;
	dns->cd = 0;
	dns->rcode = 0;
	dns->q_count = htons(1);
	dns->ans_count = 0;
	dns->auth_count = 0;
	dns->add_count = 0;

	qname = (unsigned char*) &buf[sizeof(struct DNS_HEADER)];

	ChangetoDnsNameFormat(qname,host);
	qinfo = (struct QUESTION*) &buf[sizeof(struct DNS_HEADER)
		+ (strlen((const char*)qname) + 1)];

	qinfo->qtype = htons(query_type);
	qinfo->qclass = htons(1);

	printf("\n\n发送报文中...");
	if(sendto(s,(char*)buf,sizeof(struct DNS_HEADER)+(strlen((const char*)qname)+1)+sizeof(struct QUESTION),0,(struct sockaddr*)&dest,sizeof(dest)) < 0)
	{
		perror("fails");
	}
	printf("发送成功!");

	i = sizeof(dest);
	printf("\n接收报文中...");
	if(recvfrom(s,(char*)buf,65536,0,(struct sockaddr*)&dest,(socklen_t*)&i) < 0){
	perror("fails");
	}
	printf("接收成功!");

	dns = (struct DNS_HEADER*) buf;

	reader = &buf[sizeof(struct DNS_HEADER) + (strlen((const char*)qname)+1)
		+ sizeof(struct QUESTION)];

	printf("\n\n响应报文包含:");
	printf("\n %d个问题",ntohs(dns->q_count));
	printf("\n %d个回答",ntohs(dns->ans_count));
	printf("\n %d个授权服务",ntohs(dns->auth_count));
	printf("\n %d个附加记录\n\n",ntohs(dns->add_count));


	printf("回答区域:\n");
	for(int k = 0;k < ntohs(dns->ans_count);k++){
	char aname[100];
	int alen = 0;
	bzero(aname,sizeof(aname));
	ParseDnsName(buf,reader,aname,&alen);
	reader = reader + sizeof(short);

	answers[k].resource = (struct R_DATA*) (reader);
	reader = reader + sizeof(struct R_DATA);
	int a_type = ntohs(answers[k].resource->type);
	int a_data_len = ntohs(answers[k].resource->data_len);
	
	if(a_type == A){
		answers[k].rdata = (unsigned char*)malloc(a_data_len+1);
		for(int j = 0;j < a_data_len;j++){
			answers[k].rdata[j] = reader[j];
		}
		answers[k].rdata[a_data_len] = '\0';

		long* p = (long*)answers[k].rdata;
		a.sin_addr.s_addr = *p;
		printf("%s	IN	A	%s\n",aname,inet_ntoa(a.sin_addr));
	}
	else if(a_type == NS){
		char ns[100];
		int len = 0;
		bzero(ns,sizeof(ns));
		ParseDnsName(buf,reader,ns,&len);
		printf("%s	IN	NS	%s\n",aname,ns);
	}
	else if(a_type == CNAME){
		char cname[100];
		int len = 0;
		bzero(cname,sizeof(cname));
		ParseDnsName(buf,reader,cname,&len);
		printf("%s	IN	CNAME	%s\n",aname,cname);
	}
	

	reader = reader + ntohs(answers[k].resource->data_len);
	}

	printf("\n授权区域:\n");
	for(int k = 0;k < ntohs(dns->auth_count);k++){
	char aname[100];
	int alen = 0;
	bzero(aname,sizeof(aname));
	ParseDnsName(buf,reader,aname,&alen);
	reader = reader + sizeof(short);

	answers[k].resource = (struct R_DATA*) (reader);
	reader = reader + sizeof(struct R_DATA);
	int a_type = ntohs(answers[k].resource->type);
	int a_data_len = ntohs(answers[k].resource->data_len);
	
	if(a_type == A){
		answers[k].rdata = (unsigned char*)malloc(a_data_len+1);
		for(int j = 0;j < a_data_len;j++){
			answers[k].rdata[j] = reader[j];
		}
		answers[k].rdata[a_data_len] = '\0';

		long* p = (long*)answers[k].rdata;
		a.sin_addr.s_addr = *p;
		printf("%s	IN	A	%s\n",aname,inet_ntoa(a.sin_addr));
	}
	else if(a_type == NS){
		char ns[100];
		int len = 0;
		bzero(ns,sizeof(ns));
		ParseDnsName(buf,reader,ns,&len);
		printf("%s	IN	NS	%s\n",aname,ns);
	}
	else if(a_type == CNAME){
		char cname[100];
		int len = 0;
		bzero(cname,sizeof(cname));
		ParseDnsName(buf,reader,cname,&len);
		printf("%s	IN	CNAME	%s\n",aname,cname);
	}
	

	reader = reader + ntohs(answers[k].resource->data_len);
	}

	printf("\n附加区域:\n");
	for(int k = 0;k < ntohs(dns->add_count);k++){
	char aname[100];
	int alen = 0;
	bzero(aname,sizeof(aname));
	ParseDnsName(buf,reader,aname,&alen);
	reader = reader + sizeof(short);

	answers[k].resource = (struct R_DATA*) (reader);
	reader = reader + sizeof(struct R_DATA);
	int a_type = ntohs(answers[k].resource->type);
	int a_data_len = ntohs(answers[k].resource->data_len);
	
	if(a_type == A){
		answers[k].rdata = (unsigned char*)malloc(a_data_len+1);
		for(int j = 0;j < a_data_len;j++){
			answers[k].rdata[j] = reader[j];
		}
		answers[k].rdata[a_data_len] = '\0';

		long* p = (long*)answers[k].rdata;
		a.sin_addr.s_addr = *p;
		printf("%s	IN	A	%s\n",aname,inet_ntoa(a.sin_addr));
	}
	else if(a_type == NS){
		char ns[100];
		int len = 0;
		bzero(ns,sizeof(ns));
		ParseDnsName(buf,reader,ns,&len);
		printf("%s	IN	NS	%s\n",aname,ns);
	}
	else if(a_type == CNAME){
		char cname[100];
		int len = 0;
		bzero(cname,sizeof(cname));
		ParseDnsName(buf,reader,cname,&len);
		printf("%s	IN	CNAME	%s\n",aname,cname);
	}
	

	reader = reader + ntohs(answers[k].resource->data_len);
	}
	return;
}


void ChangetoDnsNameFormat(unsigned char* dns,unsigned char* host){
	int lock = 0,i;
	strcat((char*)host,".");

	for(i=0;i<strlen((char*)host);i++){
		if(host[i] == '.'){
			*dns++ = i - lock;
			for(;lock < i;lock++)
				*dns++ = host[lock];
			lock++;
		}
	}
	*dns++ = '\0';
}

void ParseDnsName(unsigned char*buf,unsigned char*reader,char *out,int *len){
	int n,flag;
	char *pos = out + (*len);

	for(;;){
		flag = (int)reader[0];
		if(flag == 0)
			break;
		if(isPointer(flag)){
			n = (int)reader[1];
			reader = buf + n;
			ParseDnsName(buf,reader,out,len);
			break;
		}
		else{
			reader++;
			memcpy(pos,reader,flag);
			pos += flag;
			reader += flag;
			*len += flag;
			if((int)reader[0] != 0){
				memcpy(pos,".",1);
				pos += 1;
				(*len) += 1;
			}
		}
	}
}

int isPointer(int in){
	return ((in & 0xc0) == 0xc0);
}
