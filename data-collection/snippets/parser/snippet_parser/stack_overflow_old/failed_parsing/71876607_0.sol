uint32 public constant SECONDS_IN_DAY = 1 days;
struct UserInfo {
  uint256 itemCount;
  uint256 pendingPoints;
  uint256 lastUpdate;
}

mapping(address => UserInfo) public userInfo;


function pending(address account) public view returns (uint256) {
  uint256 pendingPoints = userInfo[account].pendingPoints + (((block.timestamp - userInfo[account].lastUpdate) / SECONDS_IN_DAY) * (userInfo[account].itemCount));
  return pendingPoints;
}

modifier updatePoints(address account) {
  userInfo[account].pendingPoints = pending(account);
  userInfo[account].lastUpdate = block.timestamp;
  _;
}
