function createArray() public returns(bool) {
    
    uint len = arrayOne.length;

    while (len != 1) {
        for (uint i=0; i<len; i+=2) {
            arrayTwo.push(value);
        }
        arrayOne.push(arrayTwo); 
        len = len/2;
    }
}
