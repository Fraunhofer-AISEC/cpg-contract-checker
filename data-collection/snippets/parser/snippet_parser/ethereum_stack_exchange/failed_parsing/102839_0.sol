pragma solidity ^0.5.0;

contract JointSavings {
  address payable account_one = 0xc3879B456DAA348a16B6524CBC558d2CC784722b;
  address payable account_two = 0xA29f7E79ECEA4cE30DD78cfeb9605D9aFt5143a3;

  uint public balanceContract;
  
  function withdraw(uint amount, address payable recipient) public {
    recipient.transfer(amount);
    balanceContract = address(this).balance;
  }

  function withdraw_equal() public {
    uint amount = balanceContract / 2;
    account_one.transfer(amount);
    account_two.transfer(amount);
    balanceContract = address(this).balance;
  }

  function deposit() public payable {
    balanceContract = address(this).balance;
  }

  function() external payable {}

}
