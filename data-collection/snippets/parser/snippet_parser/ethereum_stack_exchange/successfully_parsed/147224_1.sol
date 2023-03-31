contract ExampleUsers {
    
    mapping(address => User) users;

    function addUser(address adr, string memory userName) public {
        users[adr] = new User(adr, userName);
    }

    function getUserNameOfAddress(address adr) public view returns (string memory) {
        return users[adr].getUserName();
    }

    function getUserReputation(address userAddress) public view returns (uint16) {
        return users[userAddress].getUserReputation();
    }

    function updateUserReputation(address userAddress, uint16 reputation) public {
        users[userAddress].setUserReputation(reputation);
    }

    function updateUserName(address userAddress, string memory newName) public {
        users[userAddress].setUserName(newName);
    }

}
