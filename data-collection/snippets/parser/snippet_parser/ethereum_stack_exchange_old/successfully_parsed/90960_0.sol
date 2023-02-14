pragma solidity >=0.7.0 <0.8.0;

import "https://github.com/Uniswap/uniswap-v2-periphery/blob/master/contracts/interfaces/IUniswapV2Router02.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/IERC20.sol";

contract UniswapExample {
  address internal constant UNISWAP_ROUTER_ADDRESS = 0x7a250d5630B4cF539739dF2C5dAcb4c659F2488D;

  IUniswapV2Router02 public uniswapRouter;
  address private kovanDAI = 0x4F96Fe3b7A6Cf9725f59d353F723c1bDb64CA6Aa;
  address private myAccount = msg.sender;

  constructor() payable {
    uniswapRouter = IUniswapV2Router02(UNISWAP_ROUTER_ADDRESS);
  }

  function convertDAItoETH(uint daiAmountIn, uint minETHAmountToReceieve) public payable {
    IERC20 daiToken = IERC20(kovanDAI);
    require(daiToken.transferFrom(myAccount, address(this), daiAmountIn), "transferFrom failed");
    require(daiToken.approve(address(uniswapRouter), daiAmountIn), "approve failed");
    uint deadline = block.timestamp + 15; 
    uniswapRouter.swapExactTokensForETH(daiAmountIn, minETHAmountToReceieve, getPathForDAItoETH(), myAccount, deadline);
  }

  function getPathForDAItoETH() private view returns (address[] memory) {
    address[] memory path = new address[](2);
    path[0] = kovanDAI;
    path[1] = uniswapRouter.WETH();
    
    return path;
  }
}

