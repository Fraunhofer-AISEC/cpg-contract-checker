function deposit() public payable returns (uint256 tokensDeposited) {
        uint256 ethReserve = address(this).balance.sub(msg.value); 
        uint256 tokenReserve = token.balanceOf(address(this));
        uint256 tokenDeposit;

        tokenDeposit = (msg.value.mul(tokenReserve) / ethReserve).add(1); 
        uint256 liquidityMinted = msg.value.mul(totalLiquidity) / ethReserve;
        liquidity[msg.sender] = liquidity[msg.sender].add(liquidityMinted);
        totalLiquidity = totalLiquidity.add(liquidityMinted);

        require(token.transferFrom(msg.sender, address(this), tokenDeposit));
        emit LiquidityProvided(msg.sender, liquidityMinted, msg.value, tokenDeposit);
        return tokenDeposit;
    }
