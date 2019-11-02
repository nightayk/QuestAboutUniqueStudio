#include <stdio.h>
#define element int
void bucketSort(element a[],int len){
	element bucket[len/2][len];
	int i,j,k;
	element temp;

	for(i=0;i<len;i++){
		for(j=0;j<len;j++){
			bucket[i][j] = -1;
		}
	}

	for(i=0;i<len;i++){//入桶
		printf("123");
		j=-1;
		while(bucket[a[i]/2][++j]!=-1);
		bucket[a[i]/2][j] = a[i];
	}

	for(i=0;i<len/2;i++){//桶内排序
		for(j=1;bucket[i][j]!=-1;j++){
			temp = bucket[i][j];
			for(k=j;bucket[i][k]!=-1&&bucket[i][k-1]>temp;k--){
				bucket[i][k] = bucket[i][k-1];
			}
			bucket[i][k] = temp;
		}
	}

	for(i=0,k=0;i<len/2;i++){//出桶
		for(j=0;bucket[i][j]!=-1;j++){
			a[k] = bucket[i][j];
		}
	}
}

int main(){
	element a[10] = {9,6,7,8,4,5,2,3,1,1};
	bucketSort(a,10);
	for(int i=0;i<10;i++)
	printf("%d",a[i]);
}
