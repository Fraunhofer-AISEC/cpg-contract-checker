function foo(address callee, uint256 newNumber) public {
  (bool success, bytes memory returndata) = callee.call(
    abi.encodeWithSelector(ISomeOtherContract.bar.selector)
  );
}
