pragma solidity ^0.8;

import "@openzeppelin/contracts/access/AccessControl.sol";

contract MyContract is AccessControl {
    constructor(address[] memory admins) {
        for (uint i; i < admins.length; i++) {
            _setupRole(DEFAULT_ADMIN_ROLE, admins[i]);
        }
    }
}
