pragma solidity ^0.5.0;

contract Random{
    string[] choices;

    constructor() public{
        choices = ["rock", "paper", "scissors"];
    }
    function randMod() public view returns(string memory){
        return choices[uint(keccak256(abi.encodePacked(block.timestamp,block.difficulty,  msg.sender))) % 3];
    }
}
