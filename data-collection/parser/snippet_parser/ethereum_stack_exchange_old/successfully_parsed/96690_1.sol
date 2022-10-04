contract Test {
  function test (bool transaction) public view {
    if (transaction) {
      (bool success,) = address(this).staticcall(abi.encodeWithSignature("foo()"));
      require(success, "Contract call failed");
    }
  }
    
  function foo () public {
    
  }
}
