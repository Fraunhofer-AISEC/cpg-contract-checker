contract test {
  uint16 public var1;
  uint16 public var2;
  mapping(address => int) public maps;
  address[] public mapItems;

  function test() {
      var1 = 4;
      var2 = 6;
      mapItems.push(0x7E57a31C7B88a92Be263f7a9Fd6D58E6a9CE4d7C);
      maps[0x7E57a31C7B88a92Be263f7a9Fd6D58E6a9CE4d7C] = 6;
  }


}
