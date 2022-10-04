pragma solidity >=0.4.22 <0.6.0;

contract AB {
uint256 num1;
address owner;
constructor() public{
    owner = msg.sender;
}

function sendBal(address payable receiver) payable external onlyOwner {
    uint256 amount = msg.value;
    receiver.transfer(amount);  
}
}