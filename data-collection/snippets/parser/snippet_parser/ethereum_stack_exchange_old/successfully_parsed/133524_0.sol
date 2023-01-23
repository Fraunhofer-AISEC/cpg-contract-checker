
uint256 mySpecialNumber = 0;
function foo(address callee, uint256 newNumber) public {
  mySpecialNumber = newNumber;

  
  callee.call{gas: gasleft() - 2000}(
    abi.encodeWithSelector(ISomeOtherContract.bar.selector)
  );
}

