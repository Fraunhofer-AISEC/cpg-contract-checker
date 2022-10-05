pragma solidity >=0.5.10 <0.7.0;

contract User {

struct UserEntity {
   address userAddress;
   uint8 UserID; 
   string  UserName;
}

UserEntity public _UserEntity;
mapping (address=> UserEntity) UserMapping;

function addUser(address _userAddress, uint8 _UserID, string memory _UserName) public {
   _UserEntity = UserEntity(_userAddress, _UserID, _UserName);
   UserMapping[_userAddress] = _UserEntity;
}

function getUserID(address _userAddress) public view returns(uint8) {
   return(UserMapping[_userAddress].UserID);
}
}
