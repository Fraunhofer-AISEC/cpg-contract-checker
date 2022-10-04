function loginUser(string memory _name, string memory _password)
        public
        returns (bool)
    {
        address _address=msg.sender;
        if (
            keccak256(abi.encodePacked(User[_address].password)) == keccak256(abi.encodePacked(_password)) && keccak256(abi.encodePacked(User[_address].name)) ==keccak256(abi.encodePacked(_name))
        ) {
            User[_address].isUserLoggedIn = true;
            return User[_address].isUserLoggedIn;
        } else {
            return false;
        }
    }
