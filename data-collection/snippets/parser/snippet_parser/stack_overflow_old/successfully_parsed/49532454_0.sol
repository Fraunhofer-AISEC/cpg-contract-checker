pragma solidity ^0.4.18;

contract GenerateHash{
    function generateHashVal(int id, int date) pure public returns (bytes32){
        
        return keccak256(id,date);
    }
}
