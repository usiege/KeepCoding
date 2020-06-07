##ifndef MAX_NUM
#define MAX_NUM 100
#endif

void quicksort(int* a, int p, int q){
	int i = p;
	int j = q;
	int temp = a[p];
	while(i < j){
		while( a[j] >= temp && j > i) j--;
		if (j > i){		
			a[i] = a[j];
			i ++;
			while( a[i] <= temp i < j) i++;
			if(i < j){
				a[j] = a[i];
				j--;
			}
		}
	}

	a[i] = temp;

	// for (int k = p; k <= q; ++k){
	// 	if(k == i){
	// 		printf("%d\n",a[k] );
	// 		continue;
	// 	}
	// }
	if(p < i-1)	quicksort(a,p,i-1);
	if(j+1 < q)	quicksort(a,j+1,q);
}


