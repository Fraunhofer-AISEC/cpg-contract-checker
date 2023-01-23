pragma solidity ^0.5.13;
contract TransferMoney{
  
uint public receivedBalance;
function ReceiveMoney() public payable{
   receiedBalance+=msg.value;
}
function ShowContractBalance() public view returns(uint){
   return address(this).balance/10**18;
}
function ShowContractBalance(address payable toAccount, uint amount) public{
   toAccount.transfer(address(this).balance-amount);
}
}