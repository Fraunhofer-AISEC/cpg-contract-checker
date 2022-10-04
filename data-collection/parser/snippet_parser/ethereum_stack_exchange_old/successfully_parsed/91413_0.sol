interface IFreeFromUpTo {
    function freeFromUpTo(address from, uint256 value) external returns (uint256 freed);
}
contract MyContract {
  address payable manager;
  address internal constant UNISWAP_ROUTER_ADDRESS = 0x7a250d5630B4cF539739dF2C5dAcb4c659F2488D; 
  address internal constant WETH_ADDRESS = 0xd0A1E359811322d97991E03f863a0C30C2cF029C;
  address internal CHI_ADDRESS = 0x447287b508b58513DE6Cd20D9d787CF7e411b5aE;
  WETH9_ internal WETH;
  IUniswapV2Router02 internal uniswapRouter;
  IFreeFromUpTo internal chi;

  constructor() public {
    uniswapRouter = IUniswapV2Router02(UNISWAP_ROUTER_ADDRESS);
    WETH = WETH9_(WETH_ADDRESS);
    manager = msg.sender;
  }
  modifier restricted() {
      require(msg.sender == manager, "manager allowed only");
      _;
  }
  modifier discountCHI() {
    uint gasStart = gasleft();
    _;
    uint gasSpent = 21000 + gasStart - gasleft() + 16 * msg.data.length;
    chi.freeFromUpTo(msg.sender, (gasSpent + 14154) / 41947);
  }
  function Buy(uint amountOut, uint amountInMax, uint deadline, address tokenAddress) external payable restricted discountCHI {
    uniswapRouter.swapTokensForExactTokens(amountOut, amountInMax, getPathForETHtoToken(tokenAddress), address(this), deadline);
  }
  function Sell(uint amountIn, uint amountOutMin, uint deadline, address tokenAddress) external payable restricted discountCHI {
    uniswapRouter.swapExactTokensForTokens(amountIn, amountOutMin, getPathForTokentoETH(tokenAddress), address(this), deadline);
  }
  
  receive() payable external {}
}
