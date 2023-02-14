function addOneUser (User memory _user) public {

         bytes32 hash = keccak256(abi.encode(_user.name));
         users[hash] = _user;

    }
