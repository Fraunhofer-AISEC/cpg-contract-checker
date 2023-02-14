import "@uniswap/v2-periphery/contracts/interfaces/IUniswapV2Router02.sol";

contract Contract {
    address internal constant UNISWAP_ROUTER_ADDRESS =
        0x7a250d5630B4cF539739dF2C5dAcb4c659F2488D;

    IUniswapV2Router02 public uniswapRouter;
    constructor() {
        uniswapRouter = IUniswapV2Router02(UNISWAP_ROUTER_ADDRESS);
    }

    function swapEthForTokenWithUniswap(uint256 ethAmount, address tokenAddress)
        public
    {
        
        require(
            ethAmount <= address(this).balance,
            "Not enough Eth in contract to perform swap."
        );

        
        address[] memory path = new address[](2);
        path[0] = uniswapRouter.WETH();
        path[1] = tokenAddress;

        
        
        uniswapRouter.swapExactETHForTokens{value: ethAmount}(
            0,
            path,
            address(this),
            block.timestamp + 15
        );
    }

    
    receive() external payable {}
}
