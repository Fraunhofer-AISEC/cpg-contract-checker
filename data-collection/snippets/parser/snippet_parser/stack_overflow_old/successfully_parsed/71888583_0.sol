function addLiquidity() public payable {
        _approve(address(this), _pancakeRouterAddress, totalSupply());

        _pancakeRouter.addLiquidityETH(
            address(this),
            totalSupply(),
            0,
            0,
            address(this),
            block.timestamp
        );
    }
