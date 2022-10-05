bytes wordbytes = new bytes(4);
uint public i;


function setbyte(uint8 _utf8) public {
    wordbytes[i] = byte(_utf8);
    i++;                  

}
