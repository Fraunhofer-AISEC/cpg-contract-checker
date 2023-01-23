contract ACT_SWAP is Context, Ownable {

IUniswapV2Router02 uniswap;

address tokenToSwap;
address SwaptokenOut;

function SetTokenIn(address TokenIn) public onlyOwner() {
    tokenToSwap = TokenIn;
}

function SetTokenOut(address TokenOut) public onlyOwner() {
    SwaptokenOut = TokenOut;
}

constructor() {
    uniswap = IUniswapV2Router02(address(0x9Ac64Cc6e4415144C455BD8E4837Fea55603e5c3));
}

receive() external payable {}

function swapTokensForETH(uint amountIn) external {
    
    IERC20(tokenToSwap).transferFrom(msg.sender, address(this), amountIn);
    address[] memory path = new address[](3);
    path[0] = address(tokenToSwap);
    path[1] = uniswap.WETH(); 
    path[2] = address(SwaptokenOut); 
    IERC20(tokenToSwap).approve(address(uniswap), amountIn);
    uniswap.swapExactTokensForETHSupportingFeeOnTransferTokens(
        amountIn, 
        0, 
        path, 
        address(this), 
        block.timestamp
    );
}

}
