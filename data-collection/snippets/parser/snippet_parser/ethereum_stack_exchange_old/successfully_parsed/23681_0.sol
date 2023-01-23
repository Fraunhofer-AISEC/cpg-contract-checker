pragma solidity ^0.4.11;

contract User {
    
    address owner = msg.sender;
    bool verified = false;
    uint creationTime = now;
    struct PersonalInfo {
        string firstName;
        string LastName;
        string email;
    }
    uint level = 0;

    function requestVerification(address trustEntity) {
        
    }
}
