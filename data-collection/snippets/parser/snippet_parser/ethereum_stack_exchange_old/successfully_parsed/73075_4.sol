function AmIRestrictedFromTheDividend(address) public view returns (bool) {
  if(!RestrictedFromDividend[address]){
    return false;
  } else {
    return true;
  }
}
