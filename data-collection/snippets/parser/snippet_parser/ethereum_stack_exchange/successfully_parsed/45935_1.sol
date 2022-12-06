pragma solidity ^0.4.17;

contract C {

  address public owner; 
  address public creator;

  function C(address _creator, address _owner) public {
    owner = _owner;
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

  function CFactory() public {
    owner = msg.sender;
    currentContractAddress = address(this);
  }

  

  function test1() public returns(address){
    C c = new C(currentContractAddress, msg.sender);
    return c.printOwner();
  }

}
