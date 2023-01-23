pragma solidity ^0.4.11;
contract Registry {

    mapping(bytes32 => address) public ID;
    mapping(address => address) public Contract;

    event log(bytes32,address);
    function register(bytes32 _id) {
        ID[_id] = tx.origin;
        Contract[tx.origin] = msg.sender;
    }

    function getPublicAddress(bytes32 _id) constant returns (address) {
        log(_id,ID[_id]);
        return (ID[_id]);
    }

    function getContractAddress(bytes32 _id) constant returns (address) { 
        log(_id,Contract[ID[_id]]);
        return Contract[ID[_id]];
    } 
}

contract User { 
    address owner;
    Registry registry;
    
    function register(bytes32 _id) {
        registry.register(_id);
    }
    function getContractAddress(bytes32 _id) constant returns (address){
        return registry.getContractAddress(_id);
    }
    function getPublicAddress(bytes32 _id) constant returns (address) {
        return registry.getPublicAddress(_id);
    }
    function setRegister(address _addr){
        registry = Registry(_addr);
    }
}
