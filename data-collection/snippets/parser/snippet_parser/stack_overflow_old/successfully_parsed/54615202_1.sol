pragma solidity ^0.5;
contract toMyself{

address owner;

 constructor() public{
    owner = msg.sender;
}
function Send(uint x)public payable{
    msg.sender.transfer(x);
}
}
