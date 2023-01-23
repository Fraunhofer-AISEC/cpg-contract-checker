  function randModulus(uint mod) public view returns (uint) {
            return uint(keccak256(abi.encodePacked(block.timestamp, block.difficulty, randNonce))) % mod;   
        }
    
    
    function generateNumbers() external returns (uint[10] memory _generatedNumbers) {
    
    
                for (uint i=0; i<generatedNumbers.length; i++) {
                    randNonce++;
                    uint number = randModulus(81);
                    if ((generatedNumbers[i] != number) && (number != 0)) {  
                        
                        generatedNumbers[i] = randModulus(81);  
                    }
                    else {   
                        i = 0;
                    }
 
      return generatedNumbers;
        
        }
}