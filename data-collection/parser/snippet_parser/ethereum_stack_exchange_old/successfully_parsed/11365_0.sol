pragma solidity ^0.4.0;

contract jar {
  uint public target;
  uint public numDonations;

  function jar (uint _target) {
    target = _target;
    numDonations = 0;
  }

  function save() {
    numDonations++;
  }

  function getBalance() constant returns (uint) {
    return this.balance;
  }

  function withdraw () {
     if (this.balance < target) throw;
     if (!msg.sender.send(this.balance)) throw;
  }
}
