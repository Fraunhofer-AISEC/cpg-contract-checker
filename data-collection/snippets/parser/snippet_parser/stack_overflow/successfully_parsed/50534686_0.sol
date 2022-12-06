pragma solidity ^0.4.24;

contract UserRole {
    address owner;

    mapping (string => uint8) userRoles;

    constructor() 
        public
    {
        owner = msg.sender;
    }

    function set(string _username, uint8 _role) 
        public
        returns (bool sucesss)
    {
        userRoles[_username] = _role;
        return true;
    }

    function getRole(string _username) 
        public
        view
        returns (uint8 _role)
    {
        return userRoles[_username];
    }
}

contract Base {
    address owner;
    UserRole userRole;
    address public userRoleAddress;

    constructor(address _t) 
        public
    {
        owner = msg.sender;
        userRoleAddress = _t;
        userRole = UserRole(_t);
    }


    modifier isAuthorized(string _username) {
        uint8 role = 5;
        require(role < 10);
        _;
    }

    function testModifier(string _username)
        public
        isAuthorized(_username)
        view
        returns (uint8 result)
    {
        return userRole.getRole(_username);
    }
}
