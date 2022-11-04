function extract(bytes data, uint pos) constant
returns (bytes20 result)
{ 
    for (uint i=0; i<20;i++)
        result^=(bytes20(0xff00000000000000000000000000000000000000)&data[i+pos])>>(i*8);
}
