library Friends {

  struct Storage {
    address[] friendsList;
  }

  function addFriend(
    Storage storage self, 
    address friend
  ) public { 
    self.push(friend);
  }
}

contract MyContract {
  using Friends for Friends.Storage;

  Friends.Storage friendsStorage;
}
