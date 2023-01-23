pragma solidity ^0.4.11;

contract Registry {
    mapping(bytes32 => address) public ID;
    mapping(address => address) public Contract;

    function register(bytes32 _id) {
        ID[_id] = tx.origin;
        Contract[tx.origin] = msg.sender;
    }

    function getPublicAddress(bytes32 _id) constant returns (address) {
        return (ID[_id]);
    }

    function getContractAddress(bytes32 _id) constant returns (address) { 
        return Contract[ID[_id]];
    } 
}
