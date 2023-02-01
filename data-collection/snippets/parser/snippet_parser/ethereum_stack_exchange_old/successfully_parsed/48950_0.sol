pragma solidity ^0.4.23;

contract Router
{

  function funRcv (address addr) public payable
  {
    if (addr != 0x0)
    {
        addr.transfer(msg.value);
    }
  }
}
