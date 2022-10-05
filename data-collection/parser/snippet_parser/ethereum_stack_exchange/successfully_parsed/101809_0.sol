IUniswapV2Router02 usi =
    IUniswapV2Router02(0x7a250d5630B4cF539739dF2C5dAcb4c659F2488D);

function approve(ERC20 _token) external restricted {
    ERC20 token = ERC20(_token);
    require(
        token.approve(
            address(usi),
            0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        ),
        "approve failed."
    );
}

function ethToTokens(uint256 amountOutMin, address payable _token)
    external
    restricted
{
    address[] memory path = new address[](2);
    path[0] = usi.WETH();
    path[1] = _token;
    usi.swapETHForExactTokens(
        amountOutMin,
        path,
        address(this),
        block.timestamp
    );
}
