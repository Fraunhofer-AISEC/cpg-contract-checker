function hello(bytes memory data) public {
  (string memory name, uint256 age) = abi.decode(data, (string, uint));
  
}
