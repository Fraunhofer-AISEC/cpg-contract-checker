pragma solidity ^0.4.11;

contract Bank  {
    struct Balance {
      address owner;
      uint vault;
      uint profit;
    }

    Balance balance;
      mapping (address => uint) balances;

    function Bank() {
        balance.owner = msg.sender;
        balance = Balance(msg.sender, 0, 0);
    }

    function getBalance() constant returns (uint) {
        if(msg.sender == balance.owner) {
           return this.balance;
        }
        throw;
    }

    function withdrawOwner() returns (bool) {
        if(msg.sender == balance.owner) {
           balance.vault = balance.vault - balance.profit;
           bool sent = balance.owner.send(balance.profit);
           balance.profit = 0;
           return sent;
        }
        return false;
    }

    function withdraw() returns (bool) {
        uint customerBalance = balances[msg.sender];
        if(customerBalance == 0) {
          throw;
        }

        balance.vault -= customerBalance;

        balances[msg.sender] = 0;
        return msg.sender.send(customerBalance);
    }

    function deposit() payable returns (bool) {
        uint take = 100;

        uint depositAmount = msg.value;
        balance.vault += depositAmount;
        balance.profit += take;

        balances[msg.sender] = depositAmount - take;

        if(msg.value < 20) {
          throw;
        } 

        return true;
    }
}
