**
pragma solidity 0.8.0;
import '@openzeppelin/contracts/token/ERC20/ERC20.sol';
contract Router {
 
  function swapExactTokensForTokens(
    uint amountIn,
    uint amountOutMin,
    address[] calldata path,
    address to,
    uint deadline
  ) external returns (uint[] memory amounts)  {}
}
contract Swapper
{
  Router router = Router(0xa5E0829CaCEd8fFDD4De3c43696c57F7D7A678ff);
  
  ERC20 USDC_token = ERC20(0x2791Bca1f2de4661ED88A30C99A7a9449Aa84174);
  ERC20 DAI_token  = ERC20(0x8f3Cf7ad23Cd3CaDbD9735AFf958023239c6A063);
  
  ERC20 WETH_token = ERC20(0x7ceB23fD6bC0adD59E62ac25578270cFf1b9f619);
  
  ERC20 MATIC_token = ERC20(0x0000000000000000000000000000000000001010);
function swapMATICToUSDC(uint amount) public
  {
    MATIC_token.transferFrom(
     msg.sender,
     address(this),
     amount
    );
    address[] memory path = new address[](2);
    path[0] = address(MATIC_token);
    path[1] = address(USDC_token);

    MATIC_token.approve(address(router), amount);

    router.swapExactTokensForTokens(
      amount,
      0,
      path,
      msg.sender,
      block.timestamp
    );
  }
}**
