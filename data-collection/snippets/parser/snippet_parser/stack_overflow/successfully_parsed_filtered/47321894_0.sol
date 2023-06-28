pragma solidity ^0.4.18;

contract Exchange {
  mapping (address => uint256) public balances;
  string public helloworld;

  event LogDeposit(address sender, uint amount);
  event LogWithdraw(address receiver, uint amount);
  event LogTransfer(address sender, address receiver, uint amount);
  event HelloworldEvent(string helloworld);


  function Exchange() {
    helloworld = "helloworld!";
  }

  function helloWorld() returns (string) {
    return helloworld;
  }

  function deposit() payable returns(bool success) {
    balances[msg.sender] += msg.value;
    LogDeposit(msg.sender, msg.value);
    return true;
  }

  function withdraw(uint value) returns (bool success) {
    if (balances[msg.sender] < value) throw;
    balances[msg.sender] -= value;
    msg.sender.transfer(value);
    LogWithdraw(msg.sender, value);
    return true;
  }

  function transfer(address to, uint value) payable returns (bool success) {
    if (balances[msg.sender] < value) throw;
    balances[msg.sender] -= value;
    to.transfer(value);
    LogTransfer(msg.sender, to, value);
    return true;
  }

}
