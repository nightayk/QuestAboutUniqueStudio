#include <stdio.h>
#include <malloc.h>

#define element int
#define arrlen 10

void printArray(element a[],int len){
	int i;
	for(i=0;i<len;i++){
		printf("%d ",a[i]);
	}
}

void initArray(element a[]){
	a[0] = 9;
	a[1] = 6;
	a[2] = 7;
	a[3] = 8;
	a[4] = 4;
	a[5] = 5;
	a[6] = 2;
	a[7] = 3;
	a[8] = 1;
	a[9] = 1;
}

/*冒泡排序*/
void bubbleSort(element a[],int len){
	element temp;
	int i,j;
	for(i=0;i<len-1;i++){
		for(j=0;j<len-1-i;j++){
			if(a[j] > a[j+1]){
				temp = a[j];
				a[j] = a[j+1];
			        a[j+1]	= temp;
			}
		}
	}
}

/*插入排序*/
void insertSort(element a[],int len){
	element temp;
	int i,j;
	for(i=1;i<len;i++){
		temp = a[i];
		for(j=i;j>0&&a[j-1]>temp;j--){
			a[j] = a[j-1];
		}
		a[j] = temp;
	}
}

/*堆排序*/
#define leftChild(i) 2*i+1
void percDown(element a[],int i,int len){
	element temp;
	int child;

	for(temp=a[i];leftChild(i)<len;i=child){
		child = leftChild(i);
		if(child!=len-1&&a[child+1]>a[child])
			child++;
		if(temp<a[child])
			a[i]=a[child];
		else
			break;
	}
	a[i] = temp;
}

void heapSort(element a[],int len){
	element temp;
	int i;

	for(i=len/2;i>=0;i--)
		percDown(a,i,len);
	for(i=len-1;i>0;i--){
		temp = a[0];
		a[0] = a[i];
		a[i] = temp;
		percDown(a,0,i);
	}
}

/*归并排序*/
void merge(element a[],element tempA[],int leftStart,int rightStart,int rightEnd){
	int i,j,leftEnd,mergeLen,k;

	i = leftStart;
	j = rightStart;
	leftEnd = rightStart - 1;
	k = leftStart;
	mergeLen = rightEnd - leftStart + 1;

	while(i<=leftEnd && j<=rightEnd){
		if(a[i]<=a[j])
			tempA[k++] = a[i++];
		else
			tempA[k++] = a[j++];
	}

	while(i<=leftEnd)
		tempA[k++] = a[i++];
	while(j<=rightEnd)
		tempA[k++] = a[j++];

	for(i=0;i<mergeLen;i++,rightEnd--){
		a[rightEnd] = tempA[rightEnd];
	}
}

void mSort(element a[], element tempA[],int left,int right){
	if(left < right){
		int center = (left + right) / 2;
		mSort(a,tempA,left,center);
		mSort(a,tempA,center+1,right);
		merge(a,tempA,left,center+1,right);

	}
}

void mergeSort(element a[],int len){
	element* tempA;

	tempA = malloc(len * sizeof(element));
	if(tempA == NULL){
		printf("\nmalloc error!");
		return;
	}
	mSort(a,tempA,0,len - 1);
	free(tempA);
}

/*采用三数中值分割法的快速排序*/
void swap(int* a,int* b){
	int temp;
	temp = *a;
	*a = *b;
	*b = temp;
}

element median3(element a[],int left,int right){
	int center = (left + right) / 2;
	
	if(a[left] > a[center])
		swap(&a[left],&a[center]);
	if(a[left] > a[right])
		swap(&a[left],&a[right]);
	if(a[center] > a[right])
		swap(&a[center],&a[right]);

	swap(&a[center],&a[right-1]);
	return a[right - 1];
}

#define cutoff 3
void qSort(element a[],int left,int right){
	int i,j;
	element pivot;

	if(left + cutoff <= right){//如果数组过大则采用快排
		pivot = median3(a,left,right);
		i = left;
		j = right - 1;
		while(1){
			while(a[++i] < pivot);
			while(a[--j] > pivot);
			if(i<j)
				swap(&a[i],&a[j]);
			else
				break;
		}
		swap(&a[i],&a[right-1]);//将枢纽元放回原来的位置

		qSort(a,left,i-1);
		qSort(a,i+1,right);
	}
	else{
		element temp;
		int smallLen = right - left + 1;
		for(i=left+1;i<smallLen;i++){
			temp = a[i];
			for(j=i;j>left&&a[j-1]>temp;j--){
				a[j] = a[j-1];
			}
			a[j] = temp;
		}
	}
}

void quickSort(element a[],int len){
	qSort(a,0,len-1);
}

/*计数排序*/
void countSort(element a[],int len){
	element bucket[10] = {0,0,0,0,0,0,0,0,0,0};
	int i,j;

	for(i=0;i<len;i++){
		bucket[a[i]]++;
	}

	j=9;
	while(--i >= 0){
		while(bucket[i]-- > 0)
			a[j--] = i;
	}
}

/*桶式排序*/
void bucketSort(element a[],int len){
	int i,j,k;
	element temp;
	int bucketNum = len / 2;
	element bucket[bucketNum*len];
	for(i=0;i<bucketNum*len;i++){
		bucket[i] = -1;
	}

	for(i=0;i<len;i++){//入桶
		j = 0;
		while(bucket[(a[i]/2)*len+j] != -1)
			j++;
		bucket[(a[i]/2)*len+j] = a[i];
	}

	for(i=0;i<bucketNum;i++){//桶内排序
		if(bucket[i*len] == -1)
			continue;
		for(j=i*len+1;bucket[j] != -1;j++){
			temp = bucket[j];
			for(k=j;k>i*len && bucket[k-1]>temp;k--){
				bucket[k] = bucket[k-1];
			}
			bucket[k] = temp;
		}
	}

	for(i=0,k=0;i<bucketNum;i++){//出桶
		j = 0;
		while(bucket[i*len+j] != -1){
			a[k++] = bucket[i*len+j];
			j++;
		}
	}
}

int main(){
	element a[10] = {9,6,7,8,4,5,2,3,1,1};

	initArray(a);
	printf("冒泡排序前:");
	printArray(a,arrlen);

	bubbleSort(a,arrlen);

	printf("\n冒泡排序后:");
	printArray(a,arrlen);

	initArray(a);
	printf("\n\n插入排序前:");
	printArray(a,arrlen);

	insertSort(a,arrlen);

	printf("\n插入排序后:");
	printArray(a,arrlen);

	initArray(a);
	printf("\n\n堆排序前:");
	printArray(a,arrlen);

	heapSort(a,arrlen);

	printf("\n堆排序后:");
	printArray(a,arrlen);

	initArray(a);
	printf("\n\n归并排序前:");
	printArray(a,arrlen);

	mergeSort(a,arrlen);

	printf("\n归并排序后:");
	printArray(a,arrlen);

	initArray(a);
	printf("\n\n快速排序前:");
	printArray(a,arrlen);

	quickSort(a,arrlen);

	printf("\n快速排序后:");
	printArray(a,arrlen);

	initArray(a);
	printf("\n\n计数排序前:");
	printArray(a,arrlen);

	countSort(a,arrlen);

	printf("\n计数排序后:");
	printArray(a,arrlen);

	initArray(a);
	printf("\n\n桶式排序前:");
	printArray(a,arrlen);

	bucketSort(a,arrlen);

	printf("\n桶式排序后:");
	printArray(a,arrlen);
	return 0;
}
