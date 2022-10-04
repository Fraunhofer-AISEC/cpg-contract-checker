
address public CAKE_ROUTER = 0x10ED43C718714eb63d5aA57B78B54704E256024E;

function swapExactTokensForTokens(
    uint256 amountIn,
    uint256 amountOutMin,
    address[] calldata path,
    address to,
    uint256 deadline
) external override returns (bool success) 
{
    (success, ) = CAKE_ROUTER.delegatecall(
        abi.encodeWithSignature("swapExactTokensForTokens(uint256,uint256,address[],address,uint256)", amountIn, amountOutMin, path, to, deadline)
    );
    require(success, "swapExactTokensForTokens: failed");
}

