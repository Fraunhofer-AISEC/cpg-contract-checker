  function _addUser(address account) internal {
    users.add(account);
    emit UserAdded(account);
  }
