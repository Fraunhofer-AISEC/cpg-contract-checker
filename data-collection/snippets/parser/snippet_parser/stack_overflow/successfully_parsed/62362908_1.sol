pragma solidity ^0.6.2;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract MyCoin is ERC20 {

  uint public initialSupply = 10000;

  constructor() public ERC20("MyCoin", "MC") {
      _mint(msg.sender, initialSupply);
  }
}

