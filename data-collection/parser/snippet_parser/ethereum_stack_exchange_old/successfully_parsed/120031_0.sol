function _buildRequestURI(Foo memory foo) public pure returns (string memory) {
    return string(abi.encodePacked(
      BASE_URI,
      "foo=", foo.foo
    ));
  }
