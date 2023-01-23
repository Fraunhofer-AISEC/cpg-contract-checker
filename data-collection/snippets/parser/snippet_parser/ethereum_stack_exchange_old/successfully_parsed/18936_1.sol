pragma solidity ^0.4.6;

import "./Child.sol"

contract Parent {

  address owner;


  function Parent(){
    owner = msg.sender;
  }

  function createChild() {
    Child child = new Child()
  }
}
