pragma solidity ^0.7.1;

contract SendMoney {

uint public balanceReceived; 

function sendETHToSmartContract() public payable {
    balanceReceived += msg.value;
}   

function getBalance() public view returns(uint){
    return address(this).balance;
}

function sendETHOutToCaller() public {
    msg.sender.transfer(getBalance());   
}
}
