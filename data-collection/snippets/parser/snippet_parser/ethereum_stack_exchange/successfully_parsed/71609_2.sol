pragma solidity 0.5.1;

contract UserExample {

    struct UserStruct {
        
        
        
        bool isUser;          
        bool isAdmin;
    }

    mapping(address => UserStruct) public userStructs;

    function isUser(address user) public view returns(bool) {
        return userStructs[user].isUser;
    }
}
