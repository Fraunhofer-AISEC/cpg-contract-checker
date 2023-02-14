function register(string memory _name, string memory _role) public {
  require(bytes (_name).length > 0); 
  require(bytes (addressToUserData[msg.sender].name).length == 0); 
  addressToUserData[msg.sender] = userData(_name, _role);
}
