  pragma solidity ^0.4.11;

  contract TestMapping {

      mapping(uint => uint) public testMapping;

      function testMapping() public returns (uint) {
          testMapping[1] = 10;
          testMapping[1] = 20;
          return testMapping[1];
      }
  }
