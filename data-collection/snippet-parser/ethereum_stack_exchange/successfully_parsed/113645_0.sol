pragma solidity ^0.8.9;

contract JointEarnings {

address payable account_one = 0x825Ecf093bcC4de26baf8116B74255ADC9b870C5;

address payable account_two = 0xD86Df7757176B75bDFE5783c0E40c0d05eBf7eB7;

uint public balanceContract;

function distribute(uint amount, address payable recipient) public { 
     recipient.transfer(amount);
     balanceContract = address(this).balance;
}

function distribute_equal() public {
     uint amount = balanceContract / 2;
     account_one.transfer(amount);
     account_two.transfer(amount);
     balanceContract = address(this).balance;
}

function deposit() public payable {
    balanceContract = address(this).balance;
 }

function recieve() external payable {}

}
