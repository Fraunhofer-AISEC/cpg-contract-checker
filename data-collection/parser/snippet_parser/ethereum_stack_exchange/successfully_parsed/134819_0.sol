    function fund(address sender, uint256 amount) public {
        
        IERC20(i_assetAddress).transferFrom(sender, address(this), amount);
        s_funders[sender] = amount;
    }

    function supplyLiquidity(uint256 amount) public {
        IPool(i_poolAddress).supply(i_assetAddress, amount, address(this), 0);
    }
