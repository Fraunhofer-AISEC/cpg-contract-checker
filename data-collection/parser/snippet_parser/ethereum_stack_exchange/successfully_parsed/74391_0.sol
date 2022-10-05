pragma solidity ^0.5.10;

import './ContractToBeInstanced.sol';
contract newInstance {
  function newInstanceFunc(address _address) public returns(address) {
    ContractToBeInstanced T = new ContractToBeInstanced(_address);
    return T.getAddress(); 
  }
}
