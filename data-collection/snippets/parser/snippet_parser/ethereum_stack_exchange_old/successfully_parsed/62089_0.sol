pragma solidity ^0.4.23;


contract HealthcareStorage  {

  mapping (address => uint8) public userData;

  address public logicContract;
  address public owner;

  constructor(address _logicContract) public {
    logicContract = _logicContract;
    owner = msg.sender;
  }

  function updateContract(address _newAddress) public returns (bool) {
    require(msg.sender == owner);
    logicContract = _newAddress;

    return true;
  }

  function writeData(uint8 _age) public {
   logicContract.delegatecall(bytes4(keccak256("writeData(uint8)",_age)));
  }
}
