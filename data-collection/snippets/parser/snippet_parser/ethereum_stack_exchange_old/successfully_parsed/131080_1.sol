function set(address a, string memory val) public {
    (bool success, ) = address(a).call(abi.encodeWithSignature("set(string)", val));
    require(success, "Failed");
  }
