function calcBalanceFrom(address minter, uint value) public payable {
    Foo memory thisFoo = fooIndex[minter];

    thisFoo.balance += (msg.value + thisFoo.value) / value / 2; 
    thisFoo.expiresAt += 1000 + (thisFoo.balance / 10**12);

    emit NewBalance(thisFoo.balance, thisFoo.expiresAt);
  }
}
