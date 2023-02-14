
pragma solidity ^0.8.4;

contract ActualBank{
uint minAccountBalance=1 ether;
address payable owner;
mapping(address => uint256) balance ;
mapping(address => uint256) secretKey;

constructor(){
    owner=payable(msg.sender);
}

function openAccount(uint256 _secretKey) payable public returns(uint256) {
    require(msg.value >= minAccountBalance,"There must a minimum balance of 1 ether");
    balance[msg.sender]+=msg.value;
    secretKey[msg.sender]=_secretKey;
    return balance[msg.sender];
}
function withDraw(uint256 _secretKey) payable public returns(uint256) {
    require(msg.value <= balance[msg.sender],"With drawal value not correct");
    require(secretKey[msg.sender] == _secretKey, "Secret key didn't matched");
    balance[msg.sender]-=msg.value;
    address payable receiver= payable(msg.sender);
    receiver.transfer(msg.value);  
    return balance[msg.sender];
}
function getAccountBalance() public view returns(uint256){
    return balance[msg.sender];
}
}
