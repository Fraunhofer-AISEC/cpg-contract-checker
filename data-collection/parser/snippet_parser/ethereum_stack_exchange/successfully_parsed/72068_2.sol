pragma solidity ^0.5.1;

contract C { 

  function pay(address payable d) public payable { 
    d.transfer(msg.value);
  } 

  function getBalance() public view returns(uint balance) {
      return address(this).balance;
  }

}

contract D1 {

  event LogDeposit(address sender, uint amount);

  function getBalance() public view returns(uint balance) {
      return address(this).balance;
  }

  function() external payable {
      emit LogDeposit(msg.sender, msg.value);
  }  

}
