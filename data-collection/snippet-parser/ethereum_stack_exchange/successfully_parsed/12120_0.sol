pragma solidity ^0.4.0;

contract Coin {

  address public owner;
  mapping (address => uint) balances;



  function Coin() {
    owner = msg.sender;
    balances[tx.origin] = 1000;
  }


  function send(address receiver, uint amount) returns (bool success) {
    if (balances[msg.sender] < amount) {
      return  false;
    }
    balances[msg.sender] -= amount;
    balances[receiver] += amount;
    return true;

  }


  function getBalance (address user) constant returns (uint balance) {
    return balances[user];
  }
}
