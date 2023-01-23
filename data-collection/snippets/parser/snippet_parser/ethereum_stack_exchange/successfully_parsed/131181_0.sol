
pragma solidity ^0.8.0;

contract Ownable 
{    
  address private _owner;
  
  constructor()
  {
    _owner = msg.sender;
  }
  
  function owner() public view returns(address) 
  {
    return _owner;
  }
  
  modifier onlyOwner() 
  {
    require(isOwner(),
    "Function accessible only by the owner !!");
    _;
  }

  function isOwner() public view returns(bool) 
  {
    return msg.sender == _owner;
  }
}
