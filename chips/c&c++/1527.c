//15年 27题
int leafCount(BitTree T){
	int count = 0;	//保存叶子数
	Queue q = new Queue();
	q.enqueue(T);
	while(!q.empty()){
		node = q.dequeue();
		if (node != null)
		{
			if(node.firstchild == null){
				count++;
			}else{
				q.enqueue(node.firstchild);
			}

			if (node.nextsibling == null)
			{
				continue;
			}else{
				q.enqueue(node.nextsibling);
			}
		}
	}
	return count;
}