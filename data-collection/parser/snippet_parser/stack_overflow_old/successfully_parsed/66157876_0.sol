pragma solidity <0.7.0;

contract contr{

  function money()public payable{
     msg.sender.transfer(5 ether);
  }
}
