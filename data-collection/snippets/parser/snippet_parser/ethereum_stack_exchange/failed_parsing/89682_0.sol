function() external payable {
  bytes memory data = abi.encodeWithSignature("modValue(uint256)", 25);
  address _delegate = delegate;
  assembly {
    let result := delegatecall(gas, _delegate, [#1], [#2], 0, 0)
  }
}
