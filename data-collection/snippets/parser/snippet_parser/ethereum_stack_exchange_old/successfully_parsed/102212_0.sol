function swap(address tokenIn, uint amountIn, uint minOut, bytes calldata _data) external onlyOwner {
    IERC20(tokenIn).transferFrom(msg.sender, address(this), amountIn);
    IERC20(tokenIn).approve(AGGREGATION_ROUTER_V3, amountIn);

    (bool succ, bytes memory _data) = address(AGGREGATION_ROUTER_V3).call(_data);
    if (succ) {
        (uint returnAmount, uint gasLeft) = abi.decode(_data, (uint, uint));
        require(returnAmount >= minOut);
    } else {
        revert();
    }
}
