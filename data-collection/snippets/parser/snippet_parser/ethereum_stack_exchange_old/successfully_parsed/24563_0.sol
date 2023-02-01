pragma solidity ^0.4.11;

contract D {
  
  address public _e = 0x63636a7c969A0cF64395d302d3dA0C7CbcF37036; 

  function () payable {
    _e.delegatecall.gas(50000)(bytes4(sha3("deposit(address)")),this);
  }
}

contract E {
  event DepositReceived(address receiverAddress, uint256 amount);
  address public destination = 0x14d06788090769f669427b6aea1c0240d2321f34;
  function deposit(address receiver) payable {
    destination.transfer(msg.value);
    DepositReceived(receiver, msg.value);
  }
}
