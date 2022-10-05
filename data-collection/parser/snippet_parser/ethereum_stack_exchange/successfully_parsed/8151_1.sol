function test() constant returns(uint8[2], uint8) {
    uint8[2] memory a = [1, 2];
    uint8 b = 3;
    return (a, b); 
}
