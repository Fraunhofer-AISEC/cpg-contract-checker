pragma solidity ^0.4.6;

import "./Child.sol"

contract Parent {

  address owner;
  address[] public children; 
  event LogCreatedChild(address child); 

  function Parent(){
    owner = msg.sender;
  }

  function createChild() {
    Child child = new Child();
    LogChildCreated(child); 
    children.push(child); 
  }
}
