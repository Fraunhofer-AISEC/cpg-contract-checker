function setAction(address indexed objectAdd, byte actionType, byte actionValue) public returns (bool) {

    state[objectAdd].MoveState[].push("actionValue");
    emit changeAction(address indexed objectAdd, byte actionType, byte actionValue);

    return true;
  }
