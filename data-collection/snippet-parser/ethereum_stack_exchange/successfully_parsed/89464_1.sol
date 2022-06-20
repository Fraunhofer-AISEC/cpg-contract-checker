function workWithUsers(address user, bool isApproved) onlyOwner {
  users[user].isApproved = isApproved;
}
