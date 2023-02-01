function reservePlace(address _address, uint _place) public{
    require(places[_place] == 0, "Place is already reserved");
    userIds[_address] = lastUserId;
    places[_place] = lastUserId;
    lastUserId += 1;
  }
