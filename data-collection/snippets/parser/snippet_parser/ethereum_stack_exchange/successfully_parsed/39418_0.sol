pragma solidity 0.4.19;

contract EmitStringPublicAndExternal {
    event EmitString(string logme);

    function logPublic(string logme) public {
        EmitString(logme);
    }
    
    function logExternal(string logme) external {
        EmitString(logme);
    }
}
