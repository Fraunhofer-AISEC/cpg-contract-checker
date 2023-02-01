pragma solidity ^0.8.0;

contract Crud {

    struct Users{
        uint id;
        string name;
    }

    Users[] users; 
    uint length = 0;

    function addUser(string memory _name) public{
        users.push(Users(length,_name));
        length++;
    }

    function getUser(uint _index) view public returns(Users memory){
        return users[_index];
    }
}
