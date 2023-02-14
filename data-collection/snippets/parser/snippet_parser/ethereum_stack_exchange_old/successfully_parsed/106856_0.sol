    
    function trigger() external isAuthorized returns (bool) {
        uint256 bp = 8000; 
        if(totalSupply() < 1000000000){
        
            if(initialTime  >= initialTime + 90 seconds && initialTime  < initialTime + 180 seconds){
                tokensPerBlock = initalTokenPB * bp / 10000;
            }
            else if(initialTime  >= initialTime + 180 seconds){
                initalTokenPB = tokensPerBlock;
                initialTime = 180 seconds;
            }
            bool res = readyToMint();
            if(res == false) {
                return false;
            }
            else {
                mintTokens();
                return true;
            }
            
        }
    }
