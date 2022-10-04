pragma solidity >=0.5.0;

contract UserPermissions {
    string private notpermitted;
    

    mapping(address => mapping(bytes32 => mapping(address => bool))) permissions;

    constructor() public {
        notpermitted = "You do not have permission to view this users data";
    }

    function setPermissions(address they, bytes topic, bool allowed) external {
        permissions[msg.sender][topic][they] = allowed;
    }

    function getPermitted(address they, bytes topic){
        if (permissions[they][topic][msg.sender] = true) {
            
            return permissions[they][topic][msg.sender]; 
        } else {
            return notpermitted;
        };
    }

    function getOwnPermitted(){
        
    }
}
