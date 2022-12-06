pragma solidity ^0.4.18;

contract CA4 {

uint public pos;
mapping(address=>uint16) public balances;

function getBalance() view returns (uint16) {
uint16 mybalance = balances[msg.sender];
return mybalance;
}

function getAddressBalance (address myaddress) view returns (uint16) {
return balances[myaddress];
}

function setAddressBalance(address myaddress, uint16 newbalance) public {
pos=9;
balances[myaddress]=newbalance;
}

function setBalance(uint16 newbalance) public {
pos=9;
balances[msg.sender]=newbalance;
}


}
