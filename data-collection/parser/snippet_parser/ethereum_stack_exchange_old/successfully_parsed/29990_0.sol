pragma solidity ^0.4.13;

contract Sample {

mapping (address => uint) Id;
event log(address sender, uint value);

function getSender() payable returns (uint,address) {

    Id[msg.sender] = msg.value;
    log(msg.sender,msg.value);
    return (Id[msg.sender],msg.sender);
}

}
