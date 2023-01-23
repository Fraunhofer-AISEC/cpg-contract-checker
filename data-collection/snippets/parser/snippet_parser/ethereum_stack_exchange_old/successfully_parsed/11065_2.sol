function test() {

  bool isOwner;

  for(uint i = 0; i < listOfAccounts.length; i++) {

    isOwner = false;

    if(listOfAccounts[i] == owner) isOwner = true;

    if(isOwner) {
      balanceOf[listOfAccounts[i]] += share;
    }
  }  
}
