struct User {
  uint [] referrals;
}

User [] private users;

function getReferrals (uint userID) public view returns (uint [] memory) {
  return users [userID].referrals;
}
