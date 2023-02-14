  function requestAccess() payable {
    require(msg.value == price, "Incorrect sum sent to contract");
    _addUser(msg.sender);
  }
