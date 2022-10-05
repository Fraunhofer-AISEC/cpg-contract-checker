pragma solidity ^0.6.0;
pragma experimental ABIEncoderV2;

contract Foo {

  function getPatient(uint id) public view returns (patient memory) {
    return patients[id];
  }
}

