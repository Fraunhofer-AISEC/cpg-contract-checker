pragma solidity ^0.5.0;

contract A {
  address payable public owner;
  uint public block_number;

  constructor () public payable {
    owner = msg.sender;
  }

  function getBalance () public view returns (uint) {
      return address(this).balance;
  }

  function () external payable {
      block_number = block.number; 
  }
}

contract B {
  address payable public owner;
  address payable public contract_a = 0x600F51a64e8A703b759EB3d735132d6C802A0a7b;  

  constructor () public payable {
    owner = msg.sender;
  }

  function () external payable {
      contract_a.transfer(msg.value);
  }
}
