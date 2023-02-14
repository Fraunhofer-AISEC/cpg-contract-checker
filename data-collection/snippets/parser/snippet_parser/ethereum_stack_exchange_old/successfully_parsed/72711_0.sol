function addManyUsers (User [] memory _users) public {

        for (uint i = 0; i < _users.length; i++) {

           bytes32 hash = keccak256(abi.encode(_users[i].name));
           users[hash] = _users[i];

        }
    }
