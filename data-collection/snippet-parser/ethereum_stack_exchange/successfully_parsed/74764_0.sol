pragma solidity ^0.5.1;

contract matching {

    struct User {
        uint time;
        string location;
        string position;
    }
    User[] people; 

    mapping (address => User) user_mapping;
    address[] public userAccounts;

    function Set(address _address, uint _time, string memory _location, string memory _position) public {
        User storage users = user_mapping[_address];

        users.time = _time;
        users.location = _location;
        users.position = _position;

        userAccounts.push(_address) -1;
    }

    function getAccounts()public view returns(address[] memory) {
        return userAccounts;
    }

    function getInfo(address _address) view public returns (uint, string memory, string memory) {
        return (user_mapping[_address].time, user_mapping[_address].location, user_mapping[_address].position);
    }

    function countInfo() view public returns (uint) {
        return userAccounts.length;
    }
    function start() public{
     
    }

}
