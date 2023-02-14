pragma solidity ^0.4.0;

contract Coin{

  address public minter;
  mapping (address => uint) public balances;

  emit sent(_from, _to, _value);

  constructor () public{
      minter = msg.sender;
  }

  function mint(address receiver, uint amount) public {
      if(msg.sender != minter) return;
      balances[receiver] += amount;
  }

  function send(address receiver, uint amount) public {
      if (balances[msg.sender] < amount) return;
      balances[msg.sender] -=amount;
      balances[receiver] +=amount;
      sent(msg.sender,receiver,amount);
  }
} 
