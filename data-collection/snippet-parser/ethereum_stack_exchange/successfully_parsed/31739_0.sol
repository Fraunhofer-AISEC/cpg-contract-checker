pragma solidity ^0.4.14;
contract Sample {

  address private receiver;
  uint public amount;

  function pay(address _receiver, uint _amount) payable public returns (bool) {
    receiver = _receiver;
    amount =_amount;
    receiver.transfer(amount);
    return true;
  }
}
