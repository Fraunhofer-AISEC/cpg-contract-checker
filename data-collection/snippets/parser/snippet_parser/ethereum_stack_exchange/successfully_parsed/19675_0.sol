pragma solidity ^0.4.4;
import "./ConvertLib.sol";






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
        balances[tx.origin] = 10000;
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

function approveExternalTransaction() {
  count++;
  if (count == 3) {
    releaseFunds();
  }
}
  function releaseFunds () {

      sendCoin(owner, fee);

  }
}
