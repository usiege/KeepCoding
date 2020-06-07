#include <stdio.h>//头文件 
#include <stdlib.h> 
#include <malloc.h> 
typedef struct BiTNode {     
	int data;     
	struct BiTNode *lchild,*rchild; 
} BiTNode,*BiTree;//定义结点类型 

int max=-100;//把max定义得足够小 
BiTree CreateBiTree()//先序递归创建树 
{     
	int p;BiTree T;     
	scanf("%d",&p);//注意每输入两个值的时候用空格各隔开     
	if(p==0)         
		T=NULL;     
	else{
		T=(BiTNode *)malloc(sizeof(BiTNode));//为结点开辟空间         
		T->data=p;         
		T->lchild=CreateBiTree();         
		T->rchild=CreateBiTree();     
	}     
	return (T); 
} 

int Max(BiTree T)//求最大(递归算法） 
{      
	if(T==NULL)      
		return 0;  
	if(T->data > max)        
		max=T->data;        
		Max(T->lchild);       
		Max(T->rchild);            
	}     
	return max; 
} 


// int max(BiTree T){
// 	if(T==NULL)      
// 		return 0;
// 	return Max(T->lchild->data) > Max(T->rchild->data)? 
// 	Max(T->lchild->data) : Max(T->rchild->data);
// }

void main()//主函数 
{     
	BiTree Ta;     
	Ta=CreateBiTree();      
	printf("最大值是：\n");      
	printf("%d",Max(Ta));    
} 

// 原理很简单，随便通过一种遍历(我用的是先序），先把根节点的值给max，
// 然后在访问其他节点的时候判断那个值是否更大，如果是就赋值给max，最后就可以找到最大值了。














