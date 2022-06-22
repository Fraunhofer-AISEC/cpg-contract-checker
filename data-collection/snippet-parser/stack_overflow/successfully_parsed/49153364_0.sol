pragma solidity ^0.4.20;

contract cntrct {
  uint public aaa; 

  function run() payable public
  {
    aaa += msg.value;
  }

  function reader() public returns(uint)
  {
    return aaa;
  }
}
