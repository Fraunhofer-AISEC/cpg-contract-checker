mapping(address => bool) public userAuthorized;

modifier onlyUser {
  require(isUser(msg.sender));
  _;
}

function isUser(address candidate) public view returns(bool isIndeed) {
  return userAuthorized[candidate];
}

function receive() public view onlyUser {
  msg.sender.transfer(amount);
  emit ...
}

function addRemoveUser(address user, bool isAuthorized) public onlyServer {
  userAuthorized[user] = isAuthorized;
  emit ...
}
