void pass() {
	queue bus,truct,Q; /*bus表示客车队列，truck表示货车队列*/ 
	int n,tag； /* n为车号，tag为标志，tag=0表示客车，tag=1表示货车*/ 
	intcount=0，countbus=0，counttruck=0; /*分别表示上渡船汽车数、客车数、货车数*/ 
	while(count＜10){
		if( count＜4 && !empty(&bus) ) {/*客车出队*/ 
			outqueue(&bus,&n); 
			printf("上船的车号为: \n"); 

			count++;
			enqueue(&Q,n);

			countbus++;
		}else if( !empty(&truck) ) {/*货车出队*/ 
			countbus=0; 
			outqueue(&truck,&n); 
			printf("上船的车号为: \n"); 

			enqueue(&Q,n);
			count++; 

			counttruck++; 
		}else if( !empty(&bus) ) {
			counttruck=0 ; 
			outqueue(&truck,&n); 
			printf("不足10辆车排队轮渡\n"); 

			enqueue(&Q,n);
			count++; 

			countbus++; 
		}else {
			//等待车队来渡口
			printf("没有10辆车排队轮渡\n"); 
		}
	}
}
	