

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/AccessControlEnumerable.sol";
import "@openzeppelin/contracts/utils/Context.sol";
import "@openzeppelin/contracts/security/Pausable.sol";

contract SampleContract is Context, AccessControlEnumerable, Pausable {
    grantRole(
        bytes32 role, 
        address account
    )
        public
        virtual
        override
    {
        super.grantRole(role, account);
        
    }
}
