
  modifier permittedFunctionsForLINK(bytes memory _data) {
    bytes4 funcSelector;
    assembly {
      
      funcSelector := mload(add(_data, 32))
    }
    require(funcSelector == ORACLE_REQUEST_SELECTOR, "Must use whitelisted functions");
    _;
  }
