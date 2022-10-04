contract Contract {
    function test() constant returns(uint8[2], uint8[2]){
        uint8[2] memory a = [1, 2];
        uint8[2] memory b = [3, 4];
        return (a, b);
    }
}
