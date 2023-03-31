

pragma solidity ^0.8.18;

contract RandomNumber{

    address owner;

    constructor(){
        owner = msg.sender;
    }

    function getRandomNumber() external view returns(uint) {
        return block.prevrandao % 139;
    }
    function deleteContract() external {
        require(owner == msg.sender, "Not an owner;");
        selfdestruct(payable(msg.sender));
    }
}
