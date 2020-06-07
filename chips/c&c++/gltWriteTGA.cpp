GLint gltWriteTGA(const char *szFileName){
	FILE *pFile;
	TGAHEADER tagHeader;
	unsigned long lImageSize;
	GLbyte *pBits = NULL;
	GLint iViewport[4];
	GLenum lastBuffer;

	glGetIntegerv(GL_VIEWPORT,iViewport);

	lImageSize = iViewport[2] * 3 * iViewport[3];

	pBits = (GLbyte *)malloc(lImageSize);
	if(pBits == NULL) return 0;

	glPixelStorei(GL_PACK_ALIGNMENT,1);
	glPixelStorei(GL_PACK_ROW_LENGTH,0);
	glPixelStorei(GL_PACK_SKIP_ROWS,0);
	glPixelStorei(GL_PACK_SKIP_PIXELS,0);

	glGetIntegerv(GL_READ_BUFFER,&lastBuffer);
	glReadBuffer(GL_FRONT);
	glReadPixels(0,0,iViewport[2],iViewport[3],GL_BGR,GL_UNSIGNED_BYTE,pBits);
	glReadBuffer(lastBuffer);

	tagHeader.identsize = 0;
	tagHeader.colorMapType = 0;
	tagHeader.imageType = 2;
	//...

	pFile = fopen(szFileName,"wb");
	if(pFile == NULL) {
		free(pBits);
		return 0;
	}
	fwrite(&tagHeader,sizeof(TGAHEADER),1,pFile);
	fwrite(pBits,lImageSize,1,pFile);
	free(pBits);
	fcolse(pFile);

	return 1;
}