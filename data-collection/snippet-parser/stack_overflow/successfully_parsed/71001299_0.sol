pragma solidity ^0.6.6;

interface IUniswap {
  function swapExactETHForTokens(
    uint amountOutMin,
    address[] calldata path,
    address to,
    uint deadline)
  external
  payable
  returns (uint[] memory amounts);
  function WETH() external pure returns (address);
}

contract MyContract {
  IUniswap uniswap;

  constructor(address _uniswap) public {
    uniswap = IUniswap(_uniswap);
  }

  function swapExactETHForTokens(uint amountOutMin, address token) external {
    address[] memory path = new address[](2);
    path[0] = uniswap.WETH();
    path[1] = token;
    uniswap.swapExactETHForTokens{value: msg.value}(
      amountOutMin, 
      path,
      msg.sender, 
      now
    );
  }
}
