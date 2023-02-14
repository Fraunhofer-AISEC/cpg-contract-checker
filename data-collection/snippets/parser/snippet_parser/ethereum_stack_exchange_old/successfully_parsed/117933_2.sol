

pragma solidity ^0.8.11;

import {ERC20} from "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol";

contract Token is ERC20 {
  address owner;

  constructor () ERC20("MyToken", "MTK") {
    owner = msg.sender;
    _mint(msg.sender, 1000 * 10 ** 18);
  }

  function mint(address to, uint amount) external {
    require(msg.sender == owner, "Function must be called by the contract owner!");
    _mint(to, amount);
  }  
}
