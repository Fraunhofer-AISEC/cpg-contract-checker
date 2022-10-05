pragma solidity ^0.8.2;

contract SimpleToken{

mapping(address => uint) public balances;

function buyToken() payable public {
    balances[msg.sender]+=msg.value / 1 ether;
}

function sendToken(address _recipient, uint _amount) public {
    require(balances[msg.sender]!=0); 
    balances[msg.sender]-=_amount;
    balances[_recipient]+=_amount;
    }
}
