contract Test {
    function balance() public view returns(uint256) {
        return IERC20(token).balanceOf(address(this));
    }
    
    function contractAddress() public pure returns(IERC20) {
        return IERC20(token);
    }
}
