pragma solidity ^0.4.4;

contract Mortgage {

  function Mortgage()
  {
    loanApplicant = msg.sender;
    loan.status = STATUS_INITIATED;
    balances[msg.sender] = 100000000;
  }

  
  address loanApplicant;
}