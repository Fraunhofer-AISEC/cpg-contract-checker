library myArithmetic {
    bytes1[10] mData;

    function doSomeMath(bytes1[10] _input) public returns (bytes1[10]) {
        for(uint8 i=0 ; i<10 ; i++){
            mData[i] = _input[i];
        }
        
    }
}
