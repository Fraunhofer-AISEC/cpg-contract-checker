
pragma solidity ^0.7.0;

contract ContractManager {
    mapping(string => address) addressOf;
    
    constructor() {
        setAddress("ContractManager", address(this));
    }
    
    function setAddress(string memory _name, address _address) public {
        addressOf[_name] = _address; 
    }

    function getAddress(string memory _name) public view returns (address) {
        return addressOf[_name];
    }

    function deleteAddress(string memory _name) public {
        addressOf[_name] = address(0);
    }
}   
