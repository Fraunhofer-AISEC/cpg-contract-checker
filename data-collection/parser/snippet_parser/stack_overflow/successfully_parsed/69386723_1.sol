
pragma solidity ^0.8.0;

contract StackOverflow {

    struct singleUser {
        address user;
        uint256 amount;
    }

    mapping(address => uint256) private _users;
    
    function setUsers(singleUser[] memory _data) public {
        for(uint i = 0; i<_data.length; i++){
            _users[_data[i].user] = _data[i].amount;
        }
    }
    
    function getUserAmount(address user) public view returns(uint256) {
        return _users[user];
    }
}
