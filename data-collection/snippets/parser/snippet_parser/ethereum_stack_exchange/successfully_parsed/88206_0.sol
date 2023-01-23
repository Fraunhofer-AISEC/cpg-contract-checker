contract BuyToken {
  address internal constant UNISWAP_ROUTER_ADDRESS = 0x7a250d5630B4cF539739dF2C5dAcb4c659F2488D; 
  address private multiDaiKovan = 0x4F96Fe3b7A6Cf9725f59d353F723c1bDb64CA6Aa; 
  IUniswapV2Router02 public uniswapRouter;

  constructor() {
    uniswapRouter = IUniswapV2Router02(UNISWAP_ROUTER_ADDRESS);
  }

  function getPathForETHtoToken() private view returns (address[] memory) {
    address[] memory path = new address[](2);
    path[0] = uniswapRouter.WETH();
    path[1] = multiDaiKovan;

    return path;
  }

  function getEstimatedETHforToken(uint daiAmount) public view returns (uint[] memory) {
    return uniswapRouter.getAmountsIn(daiAmount, getPathForETHtoToken());
  }

  event Debug(
    uint256 ethAmountDerivable
  );

  function buy(uint tokenAmount) public payable {
    uint deadline = block.timestamp + 15; 
    uint ethAmountDerivable = getEstimatedETHforToken(tokenAmount)[0];

    
    uniswapRouter.swapETHForExactTokens{ value: ethAmountDerivable }(daiAmount, getPathForETHtoToken(), address(this), deadline);

    IERC20 token = IERC20(multiDaiKovan);
    require(token.transferFrom(msg.sender, address(this), tokenAmount), 'transferFrom failed.');
    require(token.approve(address(uniswapRouter), tokenAmount), 'approve failed.');

    emit Debug(ethAmountDerivable);
  }

  
  receive() payable external {}
}
