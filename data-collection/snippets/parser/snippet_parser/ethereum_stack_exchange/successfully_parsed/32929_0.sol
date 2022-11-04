function burnTotalSupply(uint256 tokenAmount) external onlyOwner returns (uint256) {
        require(tokenAmount > 0);
        require(totalSupply.sub(tokenAmount) > 0);

        totalSupply = totalSupply.sub(tokenAmount);
        totalSupply = totalSupply.sub(tokenAmount.div(10 ** uint256(decimals)));

        return totalSupply;
    } 
