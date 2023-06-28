pragma solidity 0.5.1;

contract Stringy {

    struct User {
        bytes32 firstName;
        bytes32 lastName;
        uint dateOfBirth;
        bytes32 email;
    } 

    mapping (address => User) registeredUsers;  
    address[] public userAddressList;

    event LogNewUser(address user, bytes32 firstName, bytes32 lastName, uint dateOfBirth, bytes32 email);

    function isUser(address user) public view returns(bool isIndeed) {
        return(registeredUsers[user].dateOfBirth > 0);
    }

    function registerUser(bytes32 _firstName, bytes32 _lastName, uint _dateOfBirth, bytes32 _email) public returns (bool success) {
        require(!isUser(msg.sender));
        require(_firstName != 0x0);
        require(_lastName != 0x0);
        require(_dateOfBirth > 0);
        require(_email > 0x0);

        registeredUsers[msg.sender] = User(_firstName, _lastName, _dateOfBirth, _email);
        userAddressList.push(msg.sender);
        emit LogNewUser(msg.sender, _firstName, _lastName, _dateOfBirth, _email);
        return true;
    }

}
