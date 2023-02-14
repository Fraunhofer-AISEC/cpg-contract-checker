pragma solidity 0.5.11;

contract TestArray {
    mapping(uint => uint[]) users;

    function addUser(uint _id, uint[] memory _users) public {
        users[_id] = _users;   
    }

    function getUsers(uint _id) public view returns(uint[] memory){
        return users[_id];
    }

    function emptyUsers(uint _id) public {
        uint[] memory empty;
        users[_id] = empty;
        
        
    }
}
