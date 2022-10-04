contract UserStorage{
  struct location{
      bytes8 latitude;
      bytes8 longitude;
      bool checked;
  }

  struct userData{
      bool isPermitted;
      bytes ownData;
      mapping (address => bytes) friends;
      address[] friendsList;
      mapping (bytes10 => location) locations;
  }

  mapping (address => userData) private users;

  function addUser(bytes ipfs, bool permitted){
      users[msg.sender].ownData = ipfs;
      users[msg.sender].isPermitted = permitted;
  }
}
