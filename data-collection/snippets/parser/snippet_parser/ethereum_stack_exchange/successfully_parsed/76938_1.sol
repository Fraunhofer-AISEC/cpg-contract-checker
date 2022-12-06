function setSpecialUser(address user, bool isAllowed) public onlySuperUser {
  specialUser[user] = isAllowed;
}
