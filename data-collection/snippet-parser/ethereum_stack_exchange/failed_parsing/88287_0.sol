
  function transferFrom(address recipient, uint256 amount, uint8 _v, bytes32 _r, bytes32 _s) public {
    address recipient = msg.sender;
    bytes32 hash = keccak256('Transfer tokens:', recipient, amount);
    address caller = ecrecover(hash, _v, _r, _s);
...
  }
