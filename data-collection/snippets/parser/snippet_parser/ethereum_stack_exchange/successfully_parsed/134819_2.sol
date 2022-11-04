function fund(address sender, uint256 amount) public {
        
        IERC20(i_assetAddress).transferFrom(sender, address(this), amount);
        approveOtherContract(IERC20(i_assetAddress), i_poolAddress);
        IPool(i_poolAddress).supply(i_assetAddress, amount, address(this), 0);

        s_funders[sender] += amount;
    }

    function approveOtherContract(IERC20 token, address recipient) public {
        token.approve(recipient, 1e18);
    }
