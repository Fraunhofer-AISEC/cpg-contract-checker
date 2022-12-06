pragma solidity ^0.4.23;

import { HealthcareStorage } from "./HealthcareStorage.sol";


contract HealthcareLogic{

  mapping (address => uint8) public userData;


  function writeData(uint8 _age) public returns (bool) {
    userData[msg.sender] = _age;

    return true;
  }

}
