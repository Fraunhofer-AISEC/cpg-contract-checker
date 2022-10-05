function balance() public view returns(uint152) {
        return uint152(IERC20(token).balanceOf(address(this)));
    }
    
    function balance1() public view returns(IERC20) {
        return IERC20(token);
    }
