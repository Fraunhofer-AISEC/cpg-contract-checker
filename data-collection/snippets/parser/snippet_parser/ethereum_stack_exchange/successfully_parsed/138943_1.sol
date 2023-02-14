  struct MyUser {
    bool exists;
    address userAddress;
  }

  mapping (address => MyUser) public myUsers;

  modifier isRegistered(address userAddress){
    require (myUsers[userAddress].exists, "Object DNE");
    _;
  }

  function newAdoption(address addy1, address addy2) public isRegistered(msg.sender){

}
