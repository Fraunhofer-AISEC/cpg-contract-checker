
    pragma solidity ^0.5.1;

contract AddressBook {
    
    address[] private _addresses;
    mapping(address => mapping(address => string)) private _aliases;

    function getAddresses() public view  returns (address [] memory) {
        return _addresses;
    }
    function addAddress(address addr, string memory _alias) public payable {
        _addresses.push(addr);
        _aliases[msg.sender][addr] = _alias;
    }
}
