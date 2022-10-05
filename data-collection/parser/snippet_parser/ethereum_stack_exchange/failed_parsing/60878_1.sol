  public function claimFrom(address minter) public payable {
    Foo memory thisFoo;
    thisFoo = fooIndex[minter];
    require(thisFoo.balance < amount);

    thisFoo.balance += msg.value;
    thisFoo.expiresAt += 1000;
  }
}
