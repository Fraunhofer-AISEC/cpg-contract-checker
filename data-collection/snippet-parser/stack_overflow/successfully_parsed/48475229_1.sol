function testAddPet() public {
  address expected = address(this);
  address[] storage adopters;
  adopters.push(expected);

  Assert.equal(adopters[0], expected, "Incorrect adopter");
}
