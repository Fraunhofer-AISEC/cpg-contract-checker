pragma solidity ^0.4.11;

contract Ownable {
  address public owner;

  function Ownable() {
    owner = msg.sender;
  }

   modifier onlyOwner() {
    if (msg.sender != owner) {
      throw;
    }
    _;
  }

  function transferOwnership(address newOwner) onlyOwner {
    if (newOwner != address(0)) {
      owner = newOwner;
    }
  }

}

contract MetaCoin is Ownable{
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

    function getBalance(address addr) constant returns(uint) {
        return balances[addr];
    }
}

contract Relay is MetaCoin {
address public owner;
uint public count;
address[] oracles;
uint public fee;


  function Relay() {
    owner = msg.sender;
    count = 0;
    fee = 10;
  }


  function fundRelay() payable returns (bool) {
    if (owner != msg.sender) throw;

  }

function approveExternalTransaction(address receiver) {
    count++;
    if (count == 3) {
      releaseFunds(receiver);
    }
  }

function releaseFunds (address receiver) {
    sendCoin(receiver, fee);
 }
}
