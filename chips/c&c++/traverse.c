void inorderTraverse(Bitree T){
	Stack S = new Stack();
	S.push(T);
	while(!S.empty()){
		p = S.pop();
		if(p){
			S.push(p->lchild);
		}else{
			visit(p);
			S.push(p->rchild);
		}
	}
}

bool isComplete(Bitree T){
	Queue q = new Queue();
	if(!T) return 1;
	q.enqueue(T);
	while(!q.empty()){
		p = q.dequeue();
		if(p){
			q.enqueue(p->lchild);
			q.enqueue(p->rchild);
		}else{
			while(!q.empty()){
				if(q.dequeue) return 0;
			}
		}
	}
	return 1;
}

static int MAXSIZE = 100;
int depth(Bitree T){
	if(!T) return 0;
	int front = -1, rear = -1;
	int last = 0, level = 0;
	Bitree Q[MAXSIZE];
	Q[++rear] = T;
	while(front < rear){
		p = Q[++front];
		if(p->lchild)
			Q[++rear] = p->lchild;
		if(p->rchild)
			Q[++rear] = p->rchild;
		if(front == last){
			level++;
			last = rear;
		}
	}
	return level;
}





