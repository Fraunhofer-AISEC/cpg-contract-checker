  address owner;

  for(uint i = 0; i < listOfAccounts.length; i++) {

    bool isOwner;
    if(listOfAccounts[i] == owner) isOwner = true;

    if(isOwner) {
      balanceOf[listOfAccounts[i]] += share;
    }

  }
