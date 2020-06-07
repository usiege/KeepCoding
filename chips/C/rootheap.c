int smallRootHeap(Seqlist L){
	int i ;
	for (i = 1; i < L.length; ++i)
	{	
		if (L.elem[(i+1)/2-1] < L.elem[i]){
			/* code */
			continue;
		}eles{
			break;
		}
	}

	if (i == L.length){
		return 1;
	}eles{
		return 0;
	}
}