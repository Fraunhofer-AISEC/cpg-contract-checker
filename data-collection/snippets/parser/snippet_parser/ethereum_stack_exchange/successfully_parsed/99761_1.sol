contract MyContract {
    function myFunction(address _tokenIn, uint256 _amountIn) external {
        IERC20(_tokenIn).approve(msg.sender, _amountIn);
        IERC20(_tokenIn).transferFrom(msg.sender, address(this), _amountIn);
    }
}
