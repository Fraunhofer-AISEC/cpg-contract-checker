
pragma solidity >=0.4.22 <0.9.0;

contract RandomNumber {

function generateRandomNumber(uint range) public view returns(uint) {


return uint(keccak256(abi.encodePacked(block.timestamp,block.difficulty, msg.sender))) % range;

}

}
