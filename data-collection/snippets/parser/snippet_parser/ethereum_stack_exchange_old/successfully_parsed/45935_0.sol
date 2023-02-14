pragma solidity ^0.4.0;

contract C {

  address public owner; 
  address public creator;

  constructor (address _creator) public {
    owner = tx.origin;
    creator = _creator;
  }

  function() public payable {}

  function printOwner() public view returns(address h) {
      h = owner;
  }

}


contract CFactory {
  address public owner;
  address public currentContractAddress;

  constructor() public {
    owner = msg.sender;
    currentContractAddress = address(this);
  }

  

  function test1() public returns(address){
    C c = new C(currentContractAddress);
    return c.printOwner();
  }

}
