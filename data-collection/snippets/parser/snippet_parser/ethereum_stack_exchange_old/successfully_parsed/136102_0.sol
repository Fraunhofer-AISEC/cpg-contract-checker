mapping (address => bool) public userRegistered;
function registerUsers(address[] calldata users) external {
  for (uint256 i; i < users.length; ++i) {
    userRegistered[users_[i]] = true;
  }
}
