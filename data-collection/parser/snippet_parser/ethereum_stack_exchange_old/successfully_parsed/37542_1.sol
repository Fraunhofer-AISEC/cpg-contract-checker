pragma solidity ^0.4.18;
contract oldContract{

  mapping(address => uint256) oldAccounts;
  mapping(uint256 => address) public accountSequence;
  
  mapping(address => bool) registered;

  address[] listOfAddresses;
  uint256 public numberOfAccounts = 0;

  function registerAccount(address user) public {
    
    require(!registered[user]);
    accountSequence[numberOfAccounts++] = user;
    listOfAddresses.push(user);
    registered[user] = true;
  }
}
