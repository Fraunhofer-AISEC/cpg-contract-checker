pragma solidity ^0.8;

contract YourContract {
  address payable owner;
  mapping(address => uint) balance;

  constructor() {
    owner = payable(msg.sender);
  }

  function mint(address _to, uint _amount) public { 
    require(msg.sender == owner, "only the contract owner can mint.");
    
    balance[_to] += _amount;
  }
}
