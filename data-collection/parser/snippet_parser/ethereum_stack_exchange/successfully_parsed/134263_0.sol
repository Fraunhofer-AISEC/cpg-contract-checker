

pragma solidity ^0.8.0;

contract ContractA {
    uint256 internal constant INITIAL_SUPPLY = 10000000;
    address public emergencyAdmin;

    constructor(
        string memory name,
        string memory symbol,
        address second
    ) {
       
        emergencyAdmin = tx.origin;
        _mint(second, INITIAL_SUPPLY ^ decimals());   
    }
}
