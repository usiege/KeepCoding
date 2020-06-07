//2012年 29
int main(){

	Semaphore	m = 0,p = 0; //同步
	Semaphore	B1 = 1,B2 = 1; //互斥

	while(1){

		read(){
			P(B1);	
			//进入B1临界区
			readToB1();
			V(m);	//可移动
		}

		move(){
			P(B2);
			P(m);	//等待移动
			//B1 B2为临界资源，只有move两个都用到了
			moveFormB1ToB2(); 
			V(p);	//可打印
			V(B1);
		}

		print(){
			P(p);	//等待打印
			printOnB2();
			//出B2临界区
			V(B2);
		}

	}

	return 0;
}