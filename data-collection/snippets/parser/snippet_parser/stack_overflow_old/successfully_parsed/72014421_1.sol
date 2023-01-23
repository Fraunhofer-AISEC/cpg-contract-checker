pragma solidity ^0.8;

contract MyContract {
    
    address[] addresses;

    
    uint256 number;

    constructor(address[] memory _addresses, uint256 _number) {
        addresses = _addresses;
        number = _number;
    }
}
