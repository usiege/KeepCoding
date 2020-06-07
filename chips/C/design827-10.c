BiTree Search(BiTree bt, datatype x)
{
	BiTree p;
	if (bt)
	{		
		if (bt->data == x) return bt;
		if(bt->lchild) p = Search(bt->lchild,x);
		if(p) return p;
		if(bt->rlchild) p = Search(bt->rlchild,x);
		if(p) return p;
	}
	return NULL;
}

 void LocateElement(LNode *head,int k)
{
       LNode *p1=head->next,*p=head;
       int i=1;
       while(p1)
       {
         p1=p1->next;
         ++i;
         if(i>=k) p=p->next;
       }
       if(p==head) return 0;
       else{
            cout<<p->data<<endl;
            return 1;
       }
}


void getCount(BiTree& t,int& leafCount,int& totalCount)
{ //获得叶子节点数目
	if(!t) return;
	totalCount++; 
	if(!t->lchild && !t->rchild)
		leafCount++;
	else{ 
		getCount(t->lchild,leafCount,totalCount);
		getCount(t->rchild,leafCount,totalCount);
	}
}


LinkList *reverselist(LinkList *head)
/* 将head 所指的单链表逆置 */
{ 
	LNode *p,*q ; /* 设置两个临时指针变量 */
	if((head->next!=NULL) && (head->next->next!=NULL))
	/* 当链表不是空表或单结点时 */
	{ 
		p=head->next;
		q=p->next;
		p->next=NULL; /*将开始结点变成终端结点 */
		while (q) /* 每次循环将后一个结点变成开始结点 */
		{
			p=q;
			q=q->next;
			p->next= head-> next;
			head->next=p;
		}
		return head;
	}
	return head; /* 如是空表或单结点表，直接返回head */
}

//【答】根据已知条件，A和B是两个递增有序表，所以我们可以以A表为基础，按照插入单个元素的办法把B表的元素插入A表中，完成后，将表逆置就得到了一个按元素值递减有序的单链表C了。
//算法如下：
LinkList *MergeSort(LinkList *A , LinkList *B )
{ /* 归并两个递增有序表为一个递减有序表 */
	LNode *pa , *pb , *qa , *qb ;
	pa=A;
	pb=B;
	qa=A->next;
	qb=B->next;

	while (qa && qb)
	{
		if(qb->data<qa->data )
		{ /* 当B中的元素小于A中当前元素时，插入到它的前面 */
			pb=qb;
			pa->next=pb;
			pb->next=qa; 
			qb=qb->next ; /* 指向B中下一元素 */
			pa=pb;
		}
		else if( qb->data>=pa-&g )
		{/*当B中元素大于等于A中当前元素，且小于等于；元素插入到A的当前元素之后*/
			pa=qa;
			qa=qa->next;/*保存A的后一元*/
			pb=qb;
			qb=qb->next;/*保存B的后一元*/
			a->next=pb;/*插入元素*/
			pb->next=qa;
			pa=pb;
		}
		else if ( qb->data>=pa->data && qb->data<=qa->data)
		{/* 当B中元素大于等于A中当前元素，且小于等于A中后一元素时，将此元素插入到A的当前元素之后 */
			pa=qa;
			qa=qa->next; /* 保存A的后一元素位置 */
			pb=qb;
			qb=qb->next; /* 保存B的后一元素位置 */
			a->next=pb; /* 插入元素 */
			pb->next=qa;
		}
		else
		{ /* 如果B中元素总是更大,指针移向下一个A元素 */
			pa=qa;
			qa=qa->next;
		}
	}
	if (qb ) /* 如果A表已到终端而B表还有结点未插入 */
	{ /* 将B表接到A表后面 */
		pa->next=qb;
	}
	C= reverselist(A); /*调用前面所设计的逆置函数 */
	return C; /* 返回新的单链表C, 已是递减排列 */
}


/* 链表节点 */
typedef struct Node {
    int data;
    struct Node *next;
} Node;
 
/* 合并两个升序链表为降序链表 */
Node *merge_lists(Node *a, Node *b)
{
    Node *pa = a->next, *pb = b->next, *t;
     
    /* 新链表的头结点使用 a 的头结点 */
    a->next = NULL;
    free(b);  // b 的头结点是不需要的，可以释放掉
     
    while(pa != NULL && pb != NULL) {
        if(pa->data < pb->data) {  // 将 pa 插入新链表头部
            t = pa->next;
            pa->next = a->next;
            a->next = pa;
            pa = t;
        } else {  // 将 pb 插入新链表头部
            t = pb->next;
            pb->next = a->next;
            a->next = pb;
            pb = t;
        }
    }
     
    /* 注：以下两个循环只会执行其中一个 */
    /* 只剩链表 a 的节点 */
    while(pa != NULL) {
        t = pa->next;
        pa->next = a->next;
        a->next = pa;
        pa = t;
    }
     
    /* 只剩链表 b 的节点 */
    while(pb != NULL) {
        t = pb->next;
        pb->next = a->next;
        a->next = pb;
        pb = t;
    }
     
    return a;
}

int waiting=0;              //等待的顾客(含正在复印的人数，最多不超过6人)  
Semaphore mutex=1;              //用于waiting变量的互斥操作  
Semaphore standup=1;            //顾客站起来准备复印的人数  
Semaphore wchair=1;         //空椅子的个数  
Semaphore ready=0;          //是否有顾客准备好  
Semaphore finish=0;         //操作员是否完成复印  
main()  
{   
	Cobegin  
           operator();  
           customer();  
    	Coend  
}  
void operator()                 //操作员进程  
{   
	while (true)  
    	{  
    		 P(ready);                   //有顾客准备好了  
        		复印;  
        		V(finsish);             //允许其他顾客复印  
   	 }	  
}  
void customer()                 //顾客进程  
{   
	P(mutex);                       //互斥waiting变量的操作  
	if (waiting<6)              //如果有空的椅子，就找到椅子坐下等待  
	{                               //含正在复印的顾客，最多可6个人等待  
	    waiting=waiting+1;      //等待顾客数增1  
	    V(mutex);                   //允许waiting变量的操作  
	}  
	else  
	{   
	    V(mutex);                   //允许waiting变量的操作  
	    离开;  
	}  
	P(wchair);                      //找一个空椅子坐下  
	P(standup);                 //再站起来准备复印  
	V(wchair);                      //允许其他人坐空椅子  
	V(ready);                       //该顾客准备好了  
	P(finish);                      //等待操作员完成  
	V(standup);                 //离开复印室  
	P(mutex);                       //互斥waiting变量的操作  
	waiting=waiting-1;          //等待顾客数减1  
	V(mutex);                       //允许waiting变量的操作  
} 









