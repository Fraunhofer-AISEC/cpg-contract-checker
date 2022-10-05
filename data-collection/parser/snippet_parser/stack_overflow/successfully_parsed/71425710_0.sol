
pragma solidity ^0.8.0;
contract RandomNumbers{
    function random(uint _mod) public view returns(uint){
        return uint(keccak256(abi.encodePacked(block.timestamp,block.difficulty,  
        msg.sender))) % _mod;
    }
}
