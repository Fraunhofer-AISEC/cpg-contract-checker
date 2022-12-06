pragma solidity ^0.4.23;

contract EtherSwap {
mapping(address => uint) balances;


address owner;


constructor() public { 
    owner = msg.sender; 
}

function() public payable {
    balances[msg.sender] += msg.value;
}   

function query() public constant returns (uint balance) {
    return balances[msg.sender];
}

function query(address id) public constant returns (uint balance) {
    return balances[id];
}

function refund(uint amountRequested) public {
    require(amountRequested > 0 && amountRequested <= balances[msg.sender]);

    balances[msg.sender] -= amountRequested;

    msg.sender.transfer(amountRequested);
}


function kill() public { if (msg.sender == owner) selfdestruct(owner); }
}