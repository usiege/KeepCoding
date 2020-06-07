int factor[100];
void balanceFactor(Bitree T){
	static int count = 0;
	if(T){
		factor[count++] = depth(T);
	}else{
		if (T->lchild)
			balanceFactor(T->lchild);
		if (T->rchild)
			balanceFactor(T->rchild);
	}
}

int depth(Bitree node){
	if(node){
		return 0;
	}else{
		int ldepth,rdepth;
		if(node->lchild)
			ldepth = depth(node->lchild)+1;
		if(node->rchild)
			rdepth = depth(node->rchild)+1;
		return ldepth - rdepth;
	}
}