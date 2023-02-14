
  mapping (address => bool) public myUsers;

  modifier isRegistered(address userAddress){
    require (myUsers[userAddress], "Object DNE");
    _;
  }

  function addUser(address _newUser) external onlyOwner() {
       myUsers[_newUser] = true;
}

  function newAdoption(address addy1, address addy2) public isRegistered(msg.sender){

}
