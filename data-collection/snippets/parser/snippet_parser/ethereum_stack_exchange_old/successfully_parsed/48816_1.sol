pragma solidity ^0.4.19;

contract Foo
{
    modifier ifHasRole(uint role) {
        if (getRoleForUser(msg.sender) == role) {
            _;
        }
    }

    function A() public ifHasRole(UserRoles.AUTHOR) ifHasRole(UserRoles.EDITOR) {
        
    }

    function B() public ifHasRole(UserRoles.AUTHOR) ifHasRole(UserRoles.CONTRIBUTOR) {
        
    }
}
