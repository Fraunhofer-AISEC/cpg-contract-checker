mapping(uint256 => address) public userList;

function getUserCount() public constant returns(uint userCount) {
 return userList.length;
}

function newUser(address _address) internal returns(bool success) {
    userList.push(_address);
    return true;
  }

function getUser(uint256 _userId) public constant returns(address){
      return(userList[_userId]);
  }
