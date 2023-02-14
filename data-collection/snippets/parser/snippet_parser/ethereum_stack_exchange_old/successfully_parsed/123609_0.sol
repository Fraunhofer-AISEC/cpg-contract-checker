pragma solidity ^0.8.0;


contract Campaign {
  
  
  address payable public immutable owner;

  
  
  address payable public immutable runner;

  
  
  address payable public immutable beneficiary;

  
  
  constructor(address payable _runner, address payable _beneficiary) {
    owner = payable(msg.sender);
    runner = _runner;
    beneficiary = _beneficiary;
  }

  
  function donate() public payable {
    
  }

  
  function withdraw() public {
    require(msg.sender == beneficiary || msg.sender == owner, "only beneficiary or owner can withdraw");
    payable(msg.sender).transfer(address(this).balance);
  }
}
