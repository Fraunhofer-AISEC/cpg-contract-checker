pragma solidity ^0.8.4;

contract MyContract {
    
    string[3] verifiedResult = ["verified successfully", "verified failed", "not clear"];
    
    function foo() external {
        
        string[3] memory anotherStringArray = ["verified successfully", "verified failed", "not clear"];
    }
}
