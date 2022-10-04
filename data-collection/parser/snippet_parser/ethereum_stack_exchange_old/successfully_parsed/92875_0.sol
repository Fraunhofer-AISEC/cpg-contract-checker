
contract D {
    
    function again(uint256[3] memory bla) external  returns(uint) {
        return bla[0];
    }
}


contract A { 
    
    function test(D f, uint256[3] memory haha) external  returns (uint) {
        return f.again(haha);
    }
    
   
}
