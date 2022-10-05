

pragma solidity ^0.8.0;

import {Proxy} from "@openzeppelin/contracts/proxy/Proxy.sol";


contract ForwardProxy is Proxy {
  address internal _forwardTo;

  constructor(address forwardTo) {
    _forwardTo = forwardTo;
  }

  
  function _delegate(address implementation) internal virtual override {
    
    assembly {
      
      
      
      calldatacopy(0, 0, calldatasize())

      
      
      
      let result := call(gas(), implementation, 0, 0, calldatasize(), 0, 0)

      
      returndatacopy(0, 0, returndatasize())

      switch result
      
      case 0 {
        revert(0, returndatasize())
      }
      default {
        return(0, returndatasize())
      }
    }
  }

  
  function _implementation() internal view virtual override returns (address) {
    return _forwardTo;
  }

  function setForwardTo(address forwardTo) external {
    _forwardTo = forwardTo;
  }
}
