function testFunction(bytes calldata params) external {
   address[] memory addresses = abi.decode(params, (address[]));
}
