#define MAX_CHAIRS 5
int waiting = 0;
Semaphore copy = 1;
Semaphore leave = 0;
Semaphore mutex = 1;

Customer(){
	P(mutex);
	if (waiting < MAX_CHAIRS)
	{
		waiting++;
		V(copy);
		//等待复印
		P(leave);
	}
	V(mutex);
}


Operator(){
	
	P(leave);
	//复印
	V(copy);

}