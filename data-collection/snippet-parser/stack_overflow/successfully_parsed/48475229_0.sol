function testAddPet() public {
  address expected = this;
  address[] storage adopters;
  adopters.push(expected);

  Assert.equal(adopters[0], expected, "Cannot add new pet" );
}
