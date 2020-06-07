//本算法将链表list（不带头结点）按结点数据域的值从小到大重新链接
void LinkListSort(LinkList &list){
	p = list->link;	//工作指针
	list->link = null;
	while(p != null){
		r = p->link;
		q = list;  //有序链表中的工作指针
		if(q->data > p->data){
			p->link = list;
			list = p;
		}else{
			while(q->link != null && q->link->data < p->data)
				q = q->link;	//有序链表中查找合适的位置
			p->link = q->link;
			q->link = p;
		}
		p = r;
	}

}