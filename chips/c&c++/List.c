void MergeList(List La,List Lb,List &Lc){
	//已知线性表La和Lb中的数据元素按值非递减排列
	//Lc也非递减排列
	InitList(Lc);
	i = j = 1;
	k = 0;
	La.len = ListLength(La);
	Lb.len = ListLength(Lb);
	while((i <= La.len) && (j <= Lb.len)){ //La Lb 不空
		GetElem(La,i,ai);
		GetElem(Lb,j,bj);
		if (ai <= bj){
			ListInsert(Lc,++k,ai);
			++i;
		}else{
			ListInsert(Lc,++k,bj);
			++j;
		}
	}
	while(i <= La.len){
		GetElem(La,i++,ai);
		ListInsert(Lc,++k,ai);
	}
	while(j <= Lb.len){
		GetElem(Lb,j++,bj);
		ListInsert(Lb,++k,bj);
	}
}

//线性表动态分配顺序存储结构
#define LIST_INIT_SIZE 100
#define LISTINCREMENT 10
typedef int* ElemType; 
typedef struct
{
	ElemType	* elem; //基址
	int 		length; //长度
	int 		listsize; //容量
}SqList;

void MergeList_Sq(SqList La,SqList Lb,SqList &Lc){
	//顺序线性表 La Lb的元素按值非递减排列
	//归并得到新的Lc也按值非递减排列
	pa = La.elem; pb = Lb.elem;
	Lc.listsize = Lc.length = La.length + Lb.length;
	pc = Lc.elem = (ElemType*)malloc(Lc.listsize*sizeof(ElemType));
	if (!Lc.elem) exit(OVERFLOW);
	pa_last = La.elem + La.length - 1;
	pb_last = Lb.elem + Lb.length - 1;

	while( pa <= pa_last && pb <= pb_last){ //归并
		if (*pa <= *pb){	
			*pc ++ = *pa ++;
		}else{
			*pc ++ = *pb ++;
		}
	}
	//插入剩余元素
	while(pa <= pa_last) *pc ++ = * pa ++;
	while(pb<= pb_last) *pc ++ = * pb ++;
}

//单链表存储结构
typedef struct LNode
{
	ElemType data;
	struct LNode * next;
}LNode, *LinkList;

Status ListInsert_L(LinkList &L, int i, ElemType e){
	//在带头结点的单链线性表L中第i个位置之前插入元素e
	p = L; j = 0;
	while(p && j < i-1){
		p = p->next;
		++ j;
	}
	if(!p || j > i) return ERROR;
	s = (LinkList)malloc(sizeof(LNode));
	s->data = e;
	s->next = p->next;
	p->next = s;
	return OK;
}

Status ListDelete_L(LinkList &L, int i, ElemType e){
	p = L; j = 0;
	while(p->next && j < i-1) return ERROR;
	q = p->next; 
	p->next = q->next;
	e = q->data; 
	free(q);
	return OK;
}

void CreateList_L(LinkList &L,int n){
	//逆位序输入n个元素的值，建立带表头结点的单链线性表L
	L = (LinkList)malloc(sizeof(LNode));
	L->next = NULL;
	for (int i = n; i > 0; --i)
	{
		/* code */
		p = (LinkList)malloc(sizeof(LNode));
		scanf(&p->data);
		p->next = L->next;
		L->next = p;
	}
}

void MergeList_L(LinkList &La, LinkList &Lb, LinkList &Lc){
	//已知单链线性表La和Lb的元素按值非递减排列
	//归并La Lb得到新的单链表Lc,Lc也非递减
	pa = La->next;
	pb = Lb->next;
	Lc  = pc = La; //La的头结点作为Lc的头结点
	while(pa && pb){
		if (pa->data <= pb->data){
			//pc始终是pa的前一项
			pc->next = pa;
			pc = pa;
			pa = pa->next;
		}else{
			pc->next = pb;
			pc = pb;
			pb = pb->next;
		}
	}
	pc->next = pa? pa : pb;
	free(Lb);
}

//双向链表存储结构
typedef struct DuLNode
{
	ElemType data;
	struct DuLNode *prior;
	struct DuLNode *next;
}DuLNode, *DuLinkList;

Status ListInsert_DuL(DuLinkList &L, int i, ElemType e){
	//在i个位置前插入e
	if(!(p = GetElemP_Dul(L,i))) return ERROR;
	if(!(s = (DuLinkList)malloc(sizeof(DuLNode)))) return ERROR;

	s->data = e;

	s->prior = p->prior;
	p->prior->next = s;

	s->next = p;
	p->prior = s;

	return OK;
}

Status ListDelete_DuL(DuLinkList &L, int i, ElemType &e){
	//删除第i个元素
	if(!(p = GetElemP_Dul(L,i)))
		return ERROR;
	e = p->data;
	p->prior->next = p->next;
	p->next->prior = p->prior;
	free(p);
	return OK;
}