pragma solidity ^0.5.0;

contract Add{
struct User {
    uint256 id;
    string name;

    

    bool set; 
}
 address owner;
 modifier onlyOwner() {
       require(owner == msg.sender);
            _;
}

mapping(address => User) public users;

function createUser(address _userAddress, uint256 _userId, string memory _userName) public onlyOwner {
    User storage user = users[_userAddress];
    
    require(!user.set);
    
    users[_userAddress] = User({
        id: _userId,
        name: _userName,
        set: true
    });
}

}
