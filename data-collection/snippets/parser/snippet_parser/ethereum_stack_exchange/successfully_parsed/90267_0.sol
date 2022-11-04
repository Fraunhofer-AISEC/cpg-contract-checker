
    function burnTokens(uint tokens) external onlyOwner freezeFunction returns (bool success) {
        require(totalSupply != 0, "unable to burn below 0 total supply");
        require(tokens != 0, "unable to burn 0 tokens");
        
        totalSupply = totalSupply.sub(tokens);
        emit TokensBurned(tokens);
        return true;
    }
