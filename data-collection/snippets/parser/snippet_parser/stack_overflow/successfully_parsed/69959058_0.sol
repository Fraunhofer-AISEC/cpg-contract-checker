pragma solidity 0.7.1;

import "https://github.com/pancakeswap/pancake-swap-periphery/blob/master/contracts/interfaces/IPancakeRouter02.sol";



contract UniswapExample {
  address internal constant UNISWAP_ROUTER_ADDRESS = 0x9Ac64Cc6e4415144C455BD8E4837Fea55603e5c3 ; 

  IPancakeRouter02 public uniswapRouter;
  
   
  
  
  
  
  
 
  address private crypto1 = 0x7ef95a0FEE0Dd31b22626fA2e10Ee6A223F8a684;
  address private crypto2 = 0x78867BbEeF44f2326bF8DDd1941a4439382EF2A7;
  address private crypto3 = 0x8a9424745056Eb399FD19a0EC26A14316684e274;
  
  

  constructor() {
    uniswapRouter = IPancakeRouter02(UNISWAP_ROUTER_ADDRESS);
    
  }
  
  function convertEthToCrypto(uint cryptoAmount) public payable {
    uint deadline = block.timestamp + 15; 
    uniswapRouter.swapETHForExactTokens{ value: msg.value }(cryptoAmount, getPathForETH(crypto1), address(this), deadline);
    
    
    (bool success,) = msg.sender.call{ value: address(this).balance }("");
    require(success, "refund failed");
  }
                 
  function getPathForETH(address crypto) public view returns (address[] memory) {
    address[] memory path = new address[](2);
    path[0] = uniswapRouter.WETH();
    path[1] = crypto;
    
    return path;
  }
  
  
  function getETH() public view returns(address) {
      return uniswapRouter.WETH();
  }
  
  
  receive() payable external {}
}
