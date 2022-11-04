contract PriceFeedTest is Test {
  function testInitialCallback() public {
      priceFeed.requestCallback("abc123", 1000000); 
      assertEq(1000000, priceFeed.price(), "Expecting price to be 1000000");
  }
}
