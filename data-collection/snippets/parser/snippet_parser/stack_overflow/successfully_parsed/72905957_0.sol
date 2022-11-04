function swapSingleParamswhitPool(
    uint256 amountIn,
    uint256 amountOutMinimum, 
    address pool, 
    address tokenIn, 
    bytes memory data) public payable {

    ITridentRouter.ExactInputSingleParams memory exactInputSingleParams = ITridentRouter.ExactInputSingleParams(amountIn, amountOutMinimum, pool, tokenIn, data);
    tridentRouter.exactInputSingle{ value: msg.value }(exactInputSingleParams);
}
