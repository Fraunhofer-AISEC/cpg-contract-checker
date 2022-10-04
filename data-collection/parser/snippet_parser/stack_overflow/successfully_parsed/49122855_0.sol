pragma solidity ^0.4.0;

contract cntrct 
{
  uint public aaa; 

  function() payable public
  {
    create(msg.value);
  }

  function create(uint _value) internal
  {
    require(_value>0);
    aaa = _value;
  }

  function reader() view public returns(uint)
  {
    return aaa;
  }
} 
