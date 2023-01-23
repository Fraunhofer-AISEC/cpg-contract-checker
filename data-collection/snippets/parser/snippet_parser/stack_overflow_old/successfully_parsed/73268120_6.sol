  function onTransferReceived(
    address from,
    uint tokensPaid,
    bytes4 selector
  ) public acceptedTokenOnly {
    (bool success,) = address(this).delegatecall(abi.encodeWithSelector(selector, from, tokensPaid));
    require(success, "Function call failed");
  }
