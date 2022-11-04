pragma solidity ^0.8.0;

contract CRUD {
 uint public maxId = 1; 
 struct User {
  uint id;
  string name;
 }

 User[] public users;

    
    function getUserIndex(uint _id) view internal returns(uint index){
        for( uint i = 0; i < users.length ; i++){
            if(users[i].id == _id){
                return i;
            }
        }
        revert('User does not exist');
    }
    
    function getUser(uint _id) view public returns(uint, string memory){
        uint userIndex = getUserIndex(_id);
        return (users[userIndex].id,users[userIndex].name);
    }
   
    function getAll() view public returns(User[] memory){
        return users;
    }

    
    function addUser(string memory _name) public returns(uint){
        users.push(User(maxId,_name));
        maxId++;
        return users.length;
    }
}
