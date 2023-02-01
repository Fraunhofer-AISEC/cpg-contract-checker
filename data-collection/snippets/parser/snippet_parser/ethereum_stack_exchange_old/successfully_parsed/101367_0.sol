pragma solidity >=0.4.22 <0.9.0;

interface ERC20{
  function deposit() external payable;
  function withdraw(uint256 amount) external;
}

contract SwapWeth {
  ERC20 weth;

  constructor(address _weth) public {
    weth = ERC20(_weth);
  }

  function swapEthForWeth() public payable {
    weth.deposit();
    weth.withdraw(msg.value);
  }

  function() external payable {
  }
}
