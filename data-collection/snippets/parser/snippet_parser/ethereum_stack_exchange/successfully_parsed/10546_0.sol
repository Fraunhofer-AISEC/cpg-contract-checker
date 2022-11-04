pragma solidity ^0.4.4;
contract Bank{
uint balance;
address owner;

event deposited(address from, string msg);
event withDrawn(address from, string msg);

function deposit(uint amount){
    balance = balance + amount;
    deposited(msg.sender, "Amount has been deposited successfully");
}

function withDraw(uint amount){
    if(amount >= balance){
        throw;
    }
    else{
        balance = balance - amount;
        withDrawn(msg.sender, "Amount has been withdrawn successfully");
    }
}

function getBalance()constant returns (uint){
    return balance;
}
}