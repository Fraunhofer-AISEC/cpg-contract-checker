 function addNewUser(address _userAddr, uint _amount) public {
        log1(
            bytes32(_userAddr),
            bytes32(msg.sender)
        );
        require(msg.sender == _userAddr); 
        uint256 id = users.push(User(_amount, _userAddr)) - 1;
        addressToUser[_userAddr] = id;
        NewUser(_amount, _userAddr); 
    }
