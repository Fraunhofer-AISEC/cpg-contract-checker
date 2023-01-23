pragma solidity ^0.5.10;

import './ContractToBeInstanced.sol';
contract newInstance {

 mapping(address=>address) public userContracts;

  function newInstanceFunc(address _address) public returns(address) {
    ContractToBeInstanced T = new ContractToBeInstanced(_address);
    address deployedAddress = address(T);
    userContracts[_address] = deployedAddress;
    return deployedAddress;
  }
}
