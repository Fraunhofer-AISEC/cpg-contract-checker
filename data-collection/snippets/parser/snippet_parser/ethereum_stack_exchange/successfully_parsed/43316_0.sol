pragma solidity ^0.4.18;

contract Banking {     
  uint deposit;       
  uint amount;       
  mapping(address => uint) accountBalance;       

  function setDeposit(uint amt)
  {
   uint new_deposit = deposit + amt;
   accountBalance[msg.sender] = new_deposit;
   deposit += amount;
  }
  function getAmount() constant returns (uint)
  {
    return(accountBalance[msg.sender]);
  }
  function withdraw(uint amt)
  {
    uint withdrawAmount = amt;
    uint newBalance = accountBalance[msg.sender] - withdrawAmount;
    accountBalance[msg.sender] = newBalance;
  }
}
