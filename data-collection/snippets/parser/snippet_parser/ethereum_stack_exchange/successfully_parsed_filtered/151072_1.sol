
    function listUser(string memory _name, uint256 _phoneNumber, UserAddress[] memory _addresses) public {
        User memory user;
        user.name = _name;
        user.phoneNumber= _phoneNumber;
        user.walletAddress = msg.sender;
        user.addresses = _addresses;
        allUsers.push(user);
        walletAddressToUser[msg.sender] = user;
    }
