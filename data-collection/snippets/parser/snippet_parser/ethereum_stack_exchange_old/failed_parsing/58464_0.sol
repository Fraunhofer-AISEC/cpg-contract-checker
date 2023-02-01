struct UserStruct {
  uint something;
  string[] fileHashes;
  boot isUser;
}

mapping(address => UserStructs) public userStructs;

function isUser(address user) public view returns(bool isIndeed) {
  return(userStructs[user].isUser;
}    

function newUser(address user, uint something) public onlyOwner returns(bool success) {
  require(!isUser(user));
  userStructs[user].something = something;
  userStructs[user].isUser = true;
  return true;
}

function appendUserFile(address user, string fileHash) public onlyOwner returns(bool success) {
  require(isUser(user));
  userStructs[user].files.push(fileHash);
  return true;
}
