function swapTokensForToken(uint256 tokenAmount) public onlyOwner {
        address[] memory path = new address[](2);
        path[0] = address(fpo);
        path[1] = address(usd);

        fpo.approve(address(router), tokenAmount);
        router.swapExactTokensForTokensSupportingFeeOnTransferTokens(
            tokenAmount,
            0, 
            path,
            address(this),
            block.timestamp
        );
    }

    function addLiquidity(uint256 tokenAmount, uint256 usdAmount) public onlyOwner {
        
        fpo.approve(address(router), tokenAmount);
        usd.approve(address(router),usdAmount);

        
        router.addLiquidity(
            address(fpo),
            address(usd),
            tokenAmount,
            usdAmount,
            0, 
            0, 
            address(0),
            block.timestamp
        );
    }

    function swapAndLiquidity() public override onlyFPO {
        uint256 tokens = fpo.balanceOf(address(this));
        uint256 half = tokens.div(2);
        uint256 otherHalf = tokens.sub(half);
        swapTokensForToken(half);
        uint256 usdBalance = usd.balanceOf(address(this));
        addLiquidity(otherHalf, usdBalance);
        emit SwapAndLiquidity(half, usdBalance, otherHalf);
    }
