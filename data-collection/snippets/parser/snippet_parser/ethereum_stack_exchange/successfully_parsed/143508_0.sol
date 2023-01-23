
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/access/AccessControl.sol";

contract MyContract is AccessControl {
    bytes32 public constant NEW_ROLE = keccak256("NEW_ROLE");
    bytes32 public constant ONE_MORE_ROLE = keccak256("ONE_MORE_ROLE");

    constructor() {
        _grantRole(DEFAULT_ADMIN_ROLE, msg.sender);
        _grantRole(NEW_ROLE, msg.sender);
        _grantRole(ONE_MORE_ROLE, msg.sender);
    }
}
