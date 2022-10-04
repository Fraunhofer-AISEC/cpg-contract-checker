contract BountyProxy {
  using BountyLibrary for BountyLibrary.Bounty;
  BountyLibrary.Bounty bounty;
  address impl;

  constructor(bytes32 _reference, address _issuer, uint _deadline, address _lib) public payable {
        impl = _lib;
        bounty.init(_reference, _issuer, _deadline);
  }

  function forward(bytes32 _sig, bytes _data) external payable {
    bytes memory data = _data;
    bytes4 sig = bytes4(_sig);
    address _impl = impl;
    require(_impl != address(0));
    assembly {

      let _message := mload(0x40) 
      mstore(_message, sig) 
      
      mstore(add(_message, 4), sload(bounty_slot))
      
      mstore(add(_message, 36), data)
      let size := returndatasize
      let result := delegatecall(gas, _impl, _message, msize, _message, size)
      
      returndatacopy(_message, 0, size)
      switch result
      case 0 {revert(_message, size) }
      default { return(_message, size) }
    }
  }

  function getBounty() external view returns (bytes32, address, uint, uint, uint, BountyLibrary.statusOptions) {
    return bounty.getBounty();
  }
}
