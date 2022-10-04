pragma solidity ^0.4.17;

contract A {
  function () public payable {
    }

  function randomEvent() public payable {
      address wallet = 0x0000; 
      wallet.transfer(address(this).balance);
    }
  }
}

contract B {
  address public platform;
  platform = 0x000; 
  uint someValue = 1000000; 

  function runIt() public payable {
    platform.transfer(someValue); 

    A ContractA = A(platform);
    ContractA.randomEvent(); 
  }
}
