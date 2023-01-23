contract PriceFeedTest is Test {
  function testInitialCallback2() public {
      stdstore
          .target(address(priceFeed))
          .sig("pendingRequests()")
          .with_key("abc123")
          .checked_write(address(this));

      priceFeed.requestCallback("abc123", 1000000);
      assertEq(1000000, priceFeed.price(), "Expecting price to be 1000000");
  }
}
