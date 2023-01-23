    pragma solidity ^0.4.24;

contract KYCPurchase {
  uint public price = 2 ether;

  struct Company {
      string registeredNumber;
      string name;
  }
  mapping (address => Company) companies;

  function buy(string registeredNumber, string name) public payable {
    require(msg.value >= price);

    
    companies[msg.sender] = Company(registeredNumber, name);
  }
}
