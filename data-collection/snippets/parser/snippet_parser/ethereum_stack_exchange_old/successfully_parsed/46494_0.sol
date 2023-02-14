pragma solidity ^0.4.13;

contract Escrow {
  address public owner;
  uint public fee;

  
  mapping (address =>  mapping (address => uint)) public balances;

  function Escrow() public {
    owner = msg.sender;
  }

  modifier onlyOwner() {
    require(msg.sender == owner);
    _;
  }

  
  function setFee(uint price) onlyOwner external {
    fee = price;
  }

  function start(address payee) payable external {
    balances[msg.sender][payee] = balances[msg.sender][payee] + msg.value;
  }

  function end(address payer, address payee) onlyOwner external {
    uint value = balances[payer][payee];
    
    
    
    
    
    payee.transfer(value)
  }
}
