  function test_add_10_and_max_should_return_err() {
    uint256 max = 2**256 - 1;
    Assert.error(SafeMathExt.add(10, max), "Addition of 10 and max should return error?");
  }
