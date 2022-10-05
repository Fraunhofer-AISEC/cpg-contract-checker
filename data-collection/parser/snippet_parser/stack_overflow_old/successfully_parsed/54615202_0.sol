pragma solidity ^0.4.24;
contract toMyself{

    address owner;

    function toMyself()public{
        owner = msg.sender;
    }
    function Send(uint x)public payable{
        owner.transfer(x);
    }
}
