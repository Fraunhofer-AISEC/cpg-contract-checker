mapping(address => uint8)  allowedUsers;

function   doSomething(address wallet) external {
    ...
    require( allowedUsers[wallet]!=1, "User already set" );
    
    allowedUsers[wallet]=1;
    ...
