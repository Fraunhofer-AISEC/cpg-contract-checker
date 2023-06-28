mapping (address => bool) private pending

function isUserPending(address user) private view returns(bool) {
  return pending[user];
}
