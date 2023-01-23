pragma solidity ^0.4.23;

import './Ownable.sol';

contract ProxyStorage is Ownable {
  address public lib;

  constructor (address _newLib) public {
    replace(_newLib);
  }

  function replace(address _newLib) public onlyOwner  {
    lib = _newLib;
  }
}

contract Proxy {
  
  function () payable public {
    ProxyStorage proxystorage = ProxyStorage(0x1111222233334444555566667777888899990000);
    address _impl = proxystorage.lib();
    require(_impl != address(0));

    assembly {
      let ptr := mload(0x40)
      calldatacopy(ptr, 0, calldatasize)
      let result := delegatecall(gas, _impl, ptr, calldatasize, 0, 0)
      let size := returndatasize
      returndatacopy(ptr, 0, size)

      switch result
      case 0 { revert(ptr, size) }
      default { return(ptr, size) }
    }
  }
}
