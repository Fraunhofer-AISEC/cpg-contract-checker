pragma solidity ^0.4.2;

import "./ConvertLib.sol";






contract MetaCoin {
    mapping (address => uint) balances;

    event Transfer(address indexed _from, address indexed _to, uint256 _value);

    function MetaCoin() {
        balances[msg.sender] = 10000;
    }

    function sendCoin(address receiver, uint amount) returns(bool sufficient) {
        if (balances[msg.sender] < amount) return false;
        balances[msg.sender] -= amount;
        balances[receiver] += amount;
        Transfer(msg.sender, receiver, amount);
        return true;
    }

    function getBalanceInEth(address addr) returns(uint){
        return ConvertLib.convert(getBalance(addr),2);
    }

    function getBalance(address addr) returns(uint) {
        return balances[addr];
    }
}

contract otherCoin {
  mapping (address => uint) balances;
  address owner;

  function otherCoin() {
    owner = msg.sender;
    balances[owner] = 10000;
  }

  function purchaseCoin(address coinContractAddress, uint amount) returns(bool sufficient) {
    MetaCoin m = MetaCoin(coinContractAddress);
    if(m.getBalance(msg.sender) >= amount) {
      balances[msg.sender] += amount;
      balances[owner] -= amount;
      m.sendCoin(owner, amount);
      return true;
    }
    throw;
  }

  function getBalance(address addr) returns(uint) {
        return balances[addr];
    }
}
