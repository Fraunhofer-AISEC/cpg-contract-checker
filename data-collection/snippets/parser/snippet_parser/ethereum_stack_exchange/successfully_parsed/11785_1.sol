pragma solidity ^0.4.8;

contract A { 

    struct ContractStructs { 
        address contractOwner;
    }

    mapping(address => ContractStructs) contractStructs; 
    address[] private contractIndex; 

    address owner; 

    function A() {
        owner = msg.sender; 
    }

    function newB() returns(address newB) {
        B b = new B(msg.sender); 
        contractStructs[b].contractOwner = msg.sender; 
        contractIndex.push(b); 
        return b; 
    }

    function getContractCount() constant returns(uint contractCount) {
        return contractIndex.length; 
    }

    function getContractAtIndex(uint index) constant returns(address contractAddress) {
        return contractIndex[index]; 
    }

    function getContractOwner(address contractAddress) constant returns(address contractOwner) {
        return contractStructs[contractAddress].contractOwner; 
    }

}

contract B { 

    address private hub;
    address private owner;

    function B(address _owner) {
        hub = msg.sender; 
        owner = _owner;
    }

    function getCreatedByHub() constant returns(address contractHub) {
        return hub;
    }

    function getContractOwner() constant returns(address contractOwner) {
        return owner; 
    }

    
    function getAInfo(address contractAddress) constant returns(address owner) {
        address randomInquiryToA = A(hub).getContractOwner(contractAddress);
        return randomInquiryToA;
    }
}
