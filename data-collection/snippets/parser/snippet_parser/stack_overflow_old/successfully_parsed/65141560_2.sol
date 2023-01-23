pragma solidity ^0.6.0;
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract GetBalance{
  constructor() public {
  }
  function getBalanceOfToken(address _USDT_ADDRESS) public returns (uint){
    usdt = IERC20(_USDT_ADDRESS);
    uint balance = usdt.balanceOf(address(this));
    return balance;
  }
}
