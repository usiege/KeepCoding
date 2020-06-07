int BtDepth(BiTree T){
	if(!T) return 0;
	int front = -1,rear = -1;
	int last = 0,level = 0; //last表示的是下层的第一个结点
	BiTree Q[MaxSize];
	Q[++rear] = T;
	BiTree p;
	while(front < rear){
		p = Q[++front];
		if (p->lchild) 	Q[++rear] = p->lchild;
		if (p->rchild) 	Q[++rear] = p->rchild;
		if (front == last)	
		{	
			level ++;
			last = rear;
		}
	}
	return level;
}