pragma solidity ^0.4.14;
contract Sample {

  address private receiver;
  uint public amount;

  function pay(address _receiver) payable public returns (bool) {
    receiver = _receiver;
    receiver.transfer(msg.value);
    return true;
  }
}
