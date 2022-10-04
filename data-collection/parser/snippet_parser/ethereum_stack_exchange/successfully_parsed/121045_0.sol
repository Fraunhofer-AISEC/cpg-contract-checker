pragma solidity ^0.5.13;

contract SendMoneyExample{
uint public balanceReceived;



function receiveMoney() public payable{
balanceReceived += msg.value;
}

function getBalance() public view returns(uint){
    return address(this).balance;
} 

 


}
