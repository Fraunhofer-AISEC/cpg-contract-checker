 uint public lastUserId = 2;

 struct User {
    uint id;
    address referrer;
    uint partnerCount;
    bool isRegistered;
}


    
    

 function userRegisteration(address _userAddress, address _referAddress) private returns(bool) {
    require(msg.value == 0.05 ether, 'registeration cost 0.05');
    
    
    
    require(!users[_userAddress].isRegistered, "User already exists"); 
    require(users[_userAddress].isRegistered, "Referrer doesn't exist");
    
    User memory user = User({
        id: lastUserId,
        referrer: _referAddress,
        partnerCount: 0,
        isRegistered: true
    });
    
    users[_userAddress] = user;
    users[_userAddress].referrer = _referAddress;
    users[_referAddress].partnerCount++;
    lastUserId++;
    
    emit registerSuccess(_userAddress, _referAddress);
    return true
}

function registeration(address _referAddress) external payable {
    userRegisteration(msg.sender, _referAddress);
}
