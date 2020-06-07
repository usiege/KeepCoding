//2013年 29
Semaphore full = 0;
Semaphore empty = 1;
Semaphore mutex = 1;

void P(){
	P(empty);
	P(mutex);
	//produce
	P(mutex);
	v(full);
}

void Q(){
	P(full);
	P(mutex);
	//consume
	P(mutex);
	v(empty);
}

void R(){
	if (empty == 1)
	{
		P(empty);
		P(mutex);
		//produce
		P(mutex);
		v(full);
	}

	if (full == 1)
	{
		P(full);
		P(mutex);
		//consume
		P(mutex);
		v(empty);
	}

}









