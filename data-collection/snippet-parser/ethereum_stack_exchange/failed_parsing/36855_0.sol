  function testBuyItem() public {
    uint8 expected = 2;
    bytes32 expectedName = "Item";

    Assert.equal(uint(8), uint(7), "Should fail");

    contract.buy.value(1 ether)(expected);
    var (typeId, name, condition) = contract.getUserItem(1);

    Assert.equal(expectedName, name, "Should be Item");
  }
