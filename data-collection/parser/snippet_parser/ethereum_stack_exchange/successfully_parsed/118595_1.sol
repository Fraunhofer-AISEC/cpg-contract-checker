contract utf8StringLength {
    

    function utfStringLength(string str) constant returns (uint length)
    {
        uint i=0;
        bytes memory string_rep = bytes(str);

        while (i<string_rep.length)
        {
            if (string_rep[i]>>7==0)
                i+=1;
            else if (string_rep[i]>>5==0x6)
                i+=2;
            else if (string_rep[i]>>4==0xE)
                i+=3;
            else if (string_rep[i]>>3==0x1E)
                i+=4;
            else
                
                i+=1;

            length++;
        }
    }

    


    

    string constant hello1= "Привет";
    string constant hello2= "Hello";
    string constant hello3= "你好";
    string constant hello4= "هيلو";
    string constant hello5= "مرحبا";


    function test() constant
    returns
        (uint,
        uint,
        uint,
        uint,
        uint)
    {
        return(
            utfStringLength(hello1),
            utfStringLength(hello2),
            utfStringLength(hello3),
            utfStringLength(hello4),
            utfStringLength(hello5)
        );
    }
    
}
