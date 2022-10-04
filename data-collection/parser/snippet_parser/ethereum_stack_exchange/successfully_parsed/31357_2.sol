pragma solidity ^0.4.18;

contract Owned {
  address public owner;
  function Owned(address _owner) public {
    owner = _owner;
  }
}


contract A is Owned{ 
  B public b;
  function A()
  Owned(msg.sender)
  { 
    b = new B(msg.sender); 
  }
}


contract B is Owned  {
  address parent;
  function B(address _owner)
  Owned(_owner)
  {
    parent = msg.sender;
  }  
}
