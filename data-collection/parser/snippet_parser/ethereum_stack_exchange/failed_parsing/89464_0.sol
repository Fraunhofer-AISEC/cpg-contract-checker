struct User {
  bool isApproved;
}

modifier onlyApproved {
  require(users[msg.sender].isApproved, "You are not registered.")
  _;
}

function doSomething(uint amount) onlyApproved ...
