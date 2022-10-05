function utfStringLength(string memory str) pure internal returns (uint length) {
    uint i=0;
    bytes memory string_rep = bytes(str);

    while (i<string_rep.length)
    {
        if (string_rep[i]>>7==0)
            i+=1;
        else if (string_rep[i]>>5==bytes1(uint8(0x6)))
            i+=2;
        else if (string_rep[i]>>4==bytes1(uint8(0xE)))
            i+=3;
        else if (string_rep[i]>>3==bytes1(uint8(0x1E)))
            i+=4;
        else
            
            i+=1;

        length++;
    }
}
