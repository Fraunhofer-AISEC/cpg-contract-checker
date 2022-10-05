pragma solidity ^0.6.0;


interface IUniswapV2Router01 {
...
}

contract MyContract {
  address internal constant UNISWAP_ROUTER_ADDRESS = 0xcDbE04934d89e97a24BCc07c3562DC8CF17d8167; 

  IUniswapV2Router01 public uniswapRouter;

  constructor() public {
    uniswapRouter = IUniswapV2Router01(UNISWAP_ROUTER_ADDRESS);
  }

  function swapEthForTokenWithUniswap(uint ethAmount, address tokenAddress) public onlyOwner {
    
    require(ethAmount <= address(this).balance, "Not enough Eth in contract to perform swap.");

    
    address[] memory path = new address[](2);
    path[0] = uniswapRouter.WETH();
    path[1] = tokenAddress;

    
    
    uniswapRouter.swapExactETHForTokens.value(ethAmount)(0, path, address(this), now + 15);
  }

  function depositEth() external payable {
    
  }
}
