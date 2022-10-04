
pragma solidity 0.8.0;

contract Users {
    mapping(address => User) _user;

    struct User {
        string _username;
        uint _age;
        
    }

    function addUser(address _userAddress, string memory _username, uint _age) public {
        _user[_userAddress] = User(_username, _age);
    }

    function getUser(address _address) view public returns(User memory) {
        return _user[_address];
    }
}
