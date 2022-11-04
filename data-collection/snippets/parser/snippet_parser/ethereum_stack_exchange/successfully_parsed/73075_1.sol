function AmIRestrictedFromTheDividend(address) public view returns (bool) {

  if(!RestrictedFromDividend[msg.sender]){

    return false;

  } else {

    return true;

  }
}
