pragma solidity ^0.4.19;

contract Foo
{
    modifier ifHasOneOf(uint[] roles) {
        for (uint i=0; i < roles.length; i++) {
            if (getRoleForUser(msg.sender) == roles[i]) {
                _;
            }
        }
    }

    function A() public ifHasOneOf([UserRoles.AUTHOR, UserRoles.EDITOR]) {
        
    }

    function B() public ifHasOneOf([UserRoles.AUTHOR, UserRoles.CONTRIBUTOR]) {
        
    }
}
