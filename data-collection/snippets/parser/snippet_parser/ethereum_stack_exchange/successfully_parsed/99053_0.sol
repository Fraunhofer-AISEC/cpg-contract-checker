function uniswapV2Call(
    address _sender,
    uint _amount0,
    uint _amount1,
    bytes calldata _data
) external {
    address[] memory path = new address[](2);
    uint amountToken = _amount0 == 0 ? _amount1 : _amount0;

    address sender = _sender;

    address token0 = IUniswapV2Pair(msg.sender).token0();
    address token1 = IUniswapV2Pair(msg.sender).token1();


    require(
        msg.sender == UniswapV2Library.pairFor(dex1FactoryAddress, token0, token1),
        'Unauthorized'
    );

    require(_amount0 == 0 || _amount1 == 0);

    path[0] = _amount0 == 0 ? token1 : token0;
    path[1] = _amount0 == 0 ? token0 : token1;

    IERC20 token = IERC20(_amount0 == 0 ? token1 : token0);
    IERC20 otherToken = IERC20(_amount0 == 0 ? token0 : token1);

    token.approve(address(sushiRouter), amountToken);

    uint amountRequired = UniswapV2Library.getAmountsIn(
        dex1FactoryAddress,
        amountToken,
        path
    )[0];

    uint amountReceived = sushiRouter.swapExactTokensForTokens(
        amountToken,
        amountRequired,
        path,
        sender,
        deadline
    )[1];

    assert(otherToken.transfer(msg.sender, amountRequired));
    assert(otherToken.transfer(tx.origin, amountReceived - amountRequired));
}
