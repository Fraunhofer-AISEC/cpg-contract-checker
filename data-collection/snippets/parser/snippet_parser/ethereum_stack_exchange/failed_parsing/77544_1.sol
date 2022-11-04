int x = 0x12345678;
char* p = (char*)&x;
for (int i = 0; i < sizeof(x); i++)
    printf("%x\n",(int)p[i]);
