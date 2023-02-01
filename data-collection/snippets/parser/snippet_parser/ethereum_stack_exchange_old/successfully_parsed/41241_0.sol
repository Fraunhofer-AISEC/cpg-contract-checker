pragma solidity ^0.4.18;

contract CA4 {


mapping(address=>uint16) public balances;

function getBalance() view returns (uint16) {
uint16 mybalance = balances[msg.sender];
return mybalance;
}

function setBalance(uint16 newbalance) public {
balances[msg.sender]=newbalance;
}


}
