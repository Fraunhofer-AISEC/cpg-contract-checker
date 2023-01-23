uint256 deadline = block.timestamp + 15;

address[] memory path = new address[](2);
path[0] = address(WETH);
path[1] = midToken;

WETH.approve(address(uniswap), loanAmount);
uniswap.swapExactTokensForTokens(loanAmount, midTokenMinAmount, path, address(this), deadline);
uint256 midTokenBalance = IERC20(midToken).balanceOf(address(this));
IERC20(midToken).approve(address(kyber), midTokenBalance);
kyber.swapTokenToToken(
    IERC20(midToken),
    midTokenBalance,
    IERC20(WETH),
    loanAmount
);
