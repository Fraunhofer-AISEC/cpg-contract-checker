struct User {
    uint id;
    address referrer;
    uint partnerCount;
    bool isRegistered;
}

uint public lastUserId = 2;

mapping(address => User) public users;

 function isUserExists(address _userAddress)  public view returns(bool) {
    
    return users[_userAddress].isRegistered;
}

function registeration(address _referAddress) external  {
    userRegisteration(msg.sender, _referAddress);
}

function userRegisteration(address _userAddress, address _referAddress) internal returns(bool) {
    
    if(users[_userAddress].isRegistered == true) {
        return false;
    }
    
    if(users[_referAddress].isRegistered == false) {
        return false;
    }
    
    
    
    
 
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
    return true;
}
  
