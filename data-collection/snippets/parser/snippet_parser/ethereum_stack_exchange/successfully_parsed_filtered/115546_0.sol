function registerUser(
        address _address,
        string memory _name,
        string memory _email,
        string memory _password
        
    ) public returns (bool) {
        require(User[_address].UserAddress != msg.sender);
        User[_address].UserAddress = _address;
        User[_address].name = _name;
        User[_address].email=_email;
        User[_address].password = _password;
        
        User[_address].isUserLoggedIn = false;
        User[_address].id=User_arr.length;

        emit RegNewUser(
        User[_address].id,
        User[_address].UserAddress,
        User[_address].name,
        User[_address].email,
        User[_address].password
        
        );
       User_arr.push(User[_address]);
        return true;
    }

    
    function loginUser(string memory _name, string memory _password)
        public
        returns (bool)
    {
        address _address=msg.sender;
        if (
            keccak256(abi.encodePacked(User[_address].password)) == keccak256(abi.encodePacked(_password)) && User[_address].name ==_name
        ) {
            User[_address].isUserLoggedIn = true;
            return User[_address].isUserLoggedIn;
        } else {
            return false;
        }
    }
