function createUser(address _userAddress, uint256 _userId, bytes32 _userName) public {
    User storage user = users[_userAddress];
    
    require(!user.set);
    
    users[_userAddress] = User({
        id: _userId,
        name: _userName,
        set: true
    });
}
