function test() constant returns(uint8[4], uint8) {
    uint8[4] memory a = [1, 2, 3, 4];
    uint8 b = 3;
    return (a, b); 
}
