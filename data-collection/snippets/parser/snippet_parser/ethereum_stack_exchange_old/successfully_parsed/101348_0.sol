function _approveWeth(uint256 _amount) internal {
        IERC20(WETH).approve(ZRX_STAKING_PROXY, _amount);
    }
