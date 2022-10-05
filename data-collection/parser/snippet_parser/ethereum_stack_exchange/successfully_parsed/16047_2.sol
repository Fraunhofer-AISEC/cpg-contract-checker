pragma solidity ^0.4.6;

contract ACL {

    mapping (address => bool) public authorized;

    modifier onlyIfAuthorized {
        if(!authorized[msg.sender]) throw;
        _;
    }

    function ACL() {
        authorized[msg.sender] = true; 
    }

    function authorizeAddress(address newUser)
        onlyIfAuthorized
        returns(bool success)
    {
        authorized[newUser] = true;
        return true;
    }

    function revokeAccess(address removeUser)
        onlyIfAuthorized
        returns(bool success)
    {
        authorized[removeUser] = false;
    }

}
