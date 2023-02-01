
  
  function _delegate(address implementation) internal virtual {
    assembly {
      
      
      
      calldatacopy(0, 0, calldatasize())

      
      
      
      let result := call(gas(), implementation, 0, calldatasize(), 0, 0)

      
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
