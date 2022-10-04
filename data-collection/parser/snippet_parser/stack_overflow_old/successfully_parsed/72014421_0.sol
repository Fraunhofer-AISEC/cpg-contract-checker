pragma solidity ^0.8;

contract MyContract {
    address[3] addresses; 
    uint256 number; 

    constructor(address[2] memory _addresses, uint256 _number) {
        addresses = _addresses;
        number = _number;
    }
}
