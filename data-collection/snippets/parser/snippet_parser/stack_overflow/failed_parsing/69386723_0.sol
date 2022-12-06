pragma solidity ^0.8.0;

struct singleUser {
    address user;
    uint amount;
}

mapping(address=>uint) private _users;

function setUsers(singleUser[] memory _data) {
    for(uint i = 0; i<_data.length; i++){
        _users[_data[i].address] = _data[i].amount;
    }
}
