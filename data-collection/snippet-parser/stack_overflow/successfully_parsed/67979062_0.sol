interface IUniswap {
            
        function WETH() external pure returns (address);
        
        function getAmountsOut(
            uint amountIn, 
            address[] calldata path)
            external
            view 
            returns (uint[] memory amounts);        
}


contract UniswapController {
    address internal constant UNISWAP_ROUTER_ADDRESS = 0x7a250d5630B4cF539739dF2C5dAcb4c659F2488D;

    IUniswap public uniswapRouter;

    address private UNISWAP_DAI_ADDRESS = 0x6B175474E89094C44Da98b954EedeAC495271d0F;

    constructor() public {
        uniswapRouter = IUniswap(UNISWAP_ROUTER_ADDRESS);
    }

    function getEstimatedETHforToken(uint daiAmount) public view returns (uint[] memory) {
        return uniswapRouter.getAmountsOut(daiAmount, getPathForETHtoDAI());

    }
    
    function getWETH() public view returns(address) {
        return uniswapRouter.WETH();
    }
    
    function getPathForETHtoDAI() public view returns (address[] memory) {
        address[] memory path = new address[](2);
        
        path[0] = uniswapRouter.WETH();
        path[1] = UNISWAP_DAI_ADDRESS;
    
        return path;
    }
}
