pragma solidity ^0.4.19;

contract Users {
    
    struct User {
        bytes32 name;
        bytes32 email;
    }

    
    mapping(uint => User[]) internal users;

    
    
    uint[] internal keys;

    function signUp(bytes32 name, bytes32 email) public {
        
        uint key = now / 1 days;

        
        if (users[key].length == 0) keys.push(key);

        
        users[key].push(User(name, email));
    }

    

    
    
    function getKeys() public view returns (uint[]) {
        return keys;
    }

    

    
    function getUsers(uint key) public view returns(User[]) {
        return users[key];
    }

    
    

    
    function getUsersCount(uint key) public view returns (uint) {
        return users[key].length;
    }

    
    

    
    function getUser(uint key, uint index) public view returns(User) {
        return users[key][index];
    }

    
    function getUserModified(uint key, uint index) public view returns(bytes32, bytes32) {
        User memory user = users[key][index];
        return (user.name, user.email);
    }

    
    
    

    
    
    
}
