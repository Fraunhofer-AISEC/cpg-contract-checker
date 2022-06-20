
pragma solidity ^0.8.0;

contract Owner {

    uint private _ids;

    struct UserDetails {
        uint256 id;
        string title;
    }

    mapping (address => UserDetails[]) public users;
    mapping (address => uint256) public userDetails; 

    function createPost(string memory _title) public {
        _ids ++; 
        uint256 _users = users[msg.sender].push(UserDetails(_ids, _title)); 
        userDetails[msg.sender] = _users;
    }
}
