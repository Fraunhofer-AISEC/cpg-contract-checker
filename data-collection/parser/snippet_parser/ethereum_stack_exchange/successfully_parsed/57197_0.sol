  function forward(bytes32 _sig, bytes memory _data) public payable {
    bytes memory data = _data;
    bytes4 sig = bytes4(_sig);
    address _impl = impl;
    require(_impl != address(0));
    assembly {
      let _message := mload(0x40) 
      mstore(_message, sig) 
      
      mstore(add(_message, 4), sload(bounty_slot))
      
      calldatacopy(add(_message, 36), 100, sub(calldatasize,100))
      
      let size := returndatasize
      let result := delegatecall(gas, _impl, _message, msize, 0, 0)
      
      returndatacopy(_message, 0, size)
      switch result
      case 0 {revert(_message, size) }
      default { return(_message, size) }
    }
  }
