import "https://github.com/Uniswap/uniswap-v2-periphery/blob/master/contracts/interfaces/IUniswapV2Router02.sol";
import "https://github.com/Uniswap/uniswap-v2-periphery/blob/master/contracts/interfaces/IERC20.sol";

contract UniswapExample2 {

    address internal constant UNISWAP_ROUTER_ADDRESS = 0x7a250d5630B4cF539739dF2C5dAcb4c659F2488D ;

    IUniswapV2Router02 public uniswapRouter;
    address private multiDaiKovan = 0x4F96Fe3b7A6Cf9725f59d353F723c1bDb64CA6Aa;
    address private USDC = 0x2F375e94FC336Cdec2Dc0cCB5277FE59CBf1cAe5;
  
    constructor() {
     uniswapRouter = IUniswapV2Router02(UNISWAP_ROUTER_ADDRESS);
  }
    function swapTokenForETH(uint amountIn, uint amountOutMin, uint deadline) public payable returns(uint[] memory) {
        
        require(USDC.transferFrom(msg.sender, address(this), amountIn), 'transferFrom failed.');
        
        require(USDC.approve(UNISWAP_ROUTER_ADDRESS, amountIn), 'approve failed.');
        
        return uniswapRouter.swapExactTokensForTokens(amountIn, amountOutMin, getPathForETHtoDAI(), msg.sender, deadline);
    }
    
    
    function getPathForETHtoDAI() private view returns (address[] memory) {
    address[] memory path = new address[](3);
    path[0] = USDC;
    path[1] = uniswapRouter.WETH();
    path[2] = multiDaiKovan;
    
    return path;
  }
}

