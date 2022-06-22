pragma solidity ^0.4.4;
contract Process{
address public owner;
uint balance;
uint amount;

function Process(){
    owner = msg.sender;
    balance = 1000;
}

 event DepositMade(string msg);
 event WithdrawalMade(string msg);

 function deposit(uint amot){
    balance = balance + amot;
    DepositMade("Deposit is done");
}

function getBalance()constant returns (uint){
    return balance;   
}

function withdraw(uint amot)returns (bool){
    if(amot > balance){
        return false;
    }
    else{
        balance = balance - amot;
        WithdrawalMade("Withdrawal is done");
        return true;
    }
}
}