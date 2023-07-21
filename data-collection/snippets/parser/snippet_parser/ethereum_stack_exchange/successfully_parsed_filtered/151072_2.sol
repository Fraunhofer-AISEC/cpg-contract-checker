    function listUser(string memory _name, uint256 _phoneNumber, UserAddress[] memory _addresses) public {
        User storage user = allUsers.push();
        user.name = _name;
        user.phoneNumber= _phoneNumber;
        user.walletAddress = msg.sender;
        user.addresses = _addresses;
        walletAddressToUser[msg.sender] = user;
    }
