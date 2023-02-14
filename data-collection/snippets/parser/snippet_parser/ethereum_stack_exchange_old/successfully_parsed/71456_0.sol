pragma solidity ^0.4.24;

contract Tester {

  struct Account {
    uint256 balance; 
  }

  mapping (address => Account) public accounts;

  function addBalance() public payable {
    Account storage a = accounts[msg.sender];
    a.balance = a.balance + msg.value;

  }


}
