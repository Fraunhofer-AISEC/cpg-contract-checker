    
    uint randNonce = 0;
    
    
    function randMod() public
    returns(uint, string memory) {
        
        randNonce++; 
    return (uint(keccak256(abi.encodePacked(block.difficulty, block.timestamp,randNonce))) % 100, "Hi random number" );
    }```
