contract FooManager {
  struct Foo {
    uint expiresAt;
    uint balance;
  }
  mapping(address => Foo) public fooIndex;

  public function claimFrom(address minter) public payable {
    require(fooIndex[minter].balance < amount);

    fooIndex[minter].balance += msg.value;
    fooIndex[minter].expiresAt += 1000;
  }
}
