pragma solidity ^0.5.8;

contract StorageContract {
    constructor () public {
       userStruct[msg.sender].userId = msg.sender;
       userStruct[msg.sender].userName = 'Jack';
       userStruct[msg.sender].isUser = true;
    }

    mapping(address => User) public userStruct;

    struct User {
        address userId;
        string userName;
        uint userRegistrationDate;
        bool isUser;
    }

    function setNewUser(address _userId, string memory _userName) public returns(address){
        require(userStruct[msg.sender].isUser == true, "Error (setNewUser)");
        User storage u = userStruct[_userId];
        u.userName = _userName;
        u.userRegistrationDate = now;
        u.isUser = true;
        return _userId;
    }
}
