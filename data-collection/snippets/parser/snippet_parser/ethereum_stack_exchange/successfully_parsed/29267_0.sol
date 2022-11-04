pragma solidity ^0.4.15;

contract D {
  uint public n;
  address public sender;
  event CallStatus(bool);

  function callSetN(address _e, uint _n) {
    if (!_e.call.gas(500000)(bytes4(sha3("setN(uint256)")), _n)) {
        CallStatus(false);
    } else {
        CallStatus(true);
    }
  }
  function callSetN2(address _e, uint _n) {
      _e.call.gas(500000)(bytes4(sha3("setN(uint256)")), _n);
  }

  function callcodeSetN(address _e, uint _n) {
    if (!_e.callcode.gas(500000)(bytes4(sha3("setN(uint256)")), _n)) {
        CallStatus(false);
    } else {
        CallStatus(true);
    }
  }

  function delegatecallSetN(address _e, uint _n) {
    if (!_e.delegatecall.gas(500000)(bytes4(sha3("setN(uint256)")), _n)) {
        CallStatus(false);
    } else {
        CallStatus(true);
    }
  }
}

contract E {
  uint public n;
  address public sender;

  function setN(uint _n) {
    n = _n;
    sender = msg.sender;
    
    
  }
}
