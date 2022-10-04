library Friends {
  struct Storage {
    address[] friendsList;
  }

  function addFriend(
    Storage storage self, 
    address friend
  ) public {
    self.friendsList.push(friend);
  }
}

contract MyContract {
  using Friends for Friends.Storage;
  Friends.Storage friendsStorage;

  function addFriend(address friend) public {
        friendsStorage.addFriend(friend);
        
  }
}
