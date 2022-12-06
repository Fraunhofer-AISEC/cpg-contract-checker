contract D {
    
    function again(uint256[] memory bla) public returns(uint) {
        return bla[0];
    }
}
contract A { 
    
   
    
    function test(D f, uint256[] memory haha) public returns(uint) {
        
        return f.again(haha);
        
    }
    
   
}

