pragma solidity ^0.4.24;

import './A.sol';

contract B {
  mapping(uint => address) instances;
  function newA(uint id) {
    instances[id] = new A();
  }
}
