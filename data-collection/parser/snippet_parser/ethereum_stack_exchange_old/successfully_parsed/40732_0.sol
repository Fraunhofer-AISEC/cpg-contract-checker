pragma solidity ^0.4.18;

contract Account {
  mapping (address => uint256) public balanceOf;

  function deposit() public payable {
    balanceOf[msg.sender] += msg.value;
  }

  function withdraw() public {
    uint256 amount = balanceOf[msg.sender];
    balanceOf[msg.sender] = 0;
    msg.sender.transfer(amount);
  }
}
