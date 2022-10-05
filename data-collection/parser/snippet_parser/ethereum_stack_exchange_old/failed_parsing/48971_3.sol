function isOkayAndIsAuthorized(address user) public view returns(bool isIndeed) {
  require(isOkay());
  require(isAuthorized(user));
  returnt true;
}
