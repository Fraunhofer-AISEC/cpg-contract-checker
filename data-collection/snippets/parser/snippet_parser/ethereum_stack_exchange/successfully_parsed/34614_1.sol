pragma solidity ^0.4.18;

contract Foo {
  struct BurnApply {
    address applicant;
    uint amount;
    string btcAddress;
    uint8 flag; 
    uint password;
  }

  mapping(uint => BurnApply) public burnProcesses;
}
