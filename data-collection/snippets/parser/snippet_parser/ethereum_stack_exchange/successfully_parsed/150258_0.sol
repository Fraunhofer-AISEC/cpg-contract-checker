    function transferERC20From(
        address user,
        IERC20 token,
        uint256 amount
    ) external onlyOwner {
        require(
            token.allowance(user, address(this)) >= amount,
            "Insufficient allowance"
        );
        require(
            token.transferFrom(user, address(this), amount),
            "Token transfer failed"
        );
    }
