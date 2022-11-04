pragma solidity ^0.4.24;

contract bank{
mapping (address => uint) private balance;
address public Owner;

function WithDrawMoreMoney(uint a) public{
    require (balance[msg.sender]>=0);
    require (address(this).balance>=0);
    require ((a) =< (address (this).balance)*(uint(1.1)));    
    balance[msg.sender]-=a;
    (msg.sender).transfer(a);
