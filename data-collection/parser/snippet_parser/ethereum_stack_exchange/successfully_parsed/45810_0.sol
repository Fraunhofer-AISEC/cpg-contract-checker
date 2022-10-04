contract Award {
    
    address public authority;
    string public hash;
    
    bool itWorked = false;
    
    mapping(address => bool) users;
    
    function Award(string _hash) public {
        authority = msg.sender;
        hash = _hash;
    }
    
    function addUser(address _address) public {
        users[_address] = true;
    }
    
    function deleteUser(address _address) public {
        users[_address] = false;
    }
    
    function hasUser(address _address) public view returns (bool) {
        return users[_address];
    }

    function test() public pure returns (bool) {
        return true;
    }
    
}
