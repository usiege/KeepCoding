//2011 29
Semaphore buffer1 = 8;
Semaphore b1empty = 0;
Semaphore buffer2 = 1;
Semaphore b2empty = 0;

P1(){
	P(buffer1);

	//放入buffer1

	V(b1empty);
}

P2(){
	P(b1empty);
	
	//从buffer1取出
	
	V(buffer1);

	P(buffer2);
	
	//将计算后的数据转到buffer2
	
	V(b2empty);
}

P3(){
	P(b2empty);
	
	//从buffer2取出
	
	V(buffer2);
}















