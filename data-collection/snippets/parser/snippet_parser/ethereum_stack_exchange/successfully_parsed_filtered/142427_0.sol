
interface IUniswapV2Router {
    function swapExactETHForTokens(
        uint amountOutMin,
        address[] calldata path,
        address to,
        uint deadline
    ) external payable returns (uint[] memory amounts);
}


contract Test{
    address UNISWAP_V2_ROUTER = 0x7a250d5630B4cF539739dF2C5dAcb4c659F2488D;
    address WETH = 0xB4FBF271143F4FBf7B91A5ded31805e42b2208d6;

    function ConvertEthToUSDC(address _tokenOut) public payable returns(bool) {
        address[] memory path;
        path = new address[](2);
        path[1] = WETH;
        path[2] = _tokenOut;

        
        
        IUniswapV2Router(UNISWAP_V2_ROUTER).swapExactETHForTokens{value: msg.value}(0, path, msg.sender, block.timestamp + 600);        
    }
}
