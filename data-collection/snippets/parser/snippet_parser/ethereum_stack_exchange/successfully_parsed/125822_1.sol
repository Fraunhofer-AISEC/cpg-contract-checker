pragma solidity 0.4.24;


contract Initializable {
  bool private initialized;
  bool private initializing;

  modifier initializer() {
    require(initializing || isConstructor() || !initialized, "Contract instance has already been initialized");

    bool wasInitializing = initializing;
    initializing = true;
    initialized = true;

    _;

    initializing = wasInitializing;
  }

  function isConstructor() private view returns (bool) {
    uint256 cs;
    assembly { cs := extcodesize(address) }
    return cs == 0;
  }

  uint256 internal second;
  uint256[47] private ______gap;
  uint256 internal first;
}

contract MyContract is Initializable {
    function initialize(uint256 _first) external initializer {
        first = _first;
    }

    function returnFirst() external view returns (uint) {
        return first;
    }
}

contract MyContractV2 is MyContract {
    
    bool private initializedV2;

    function initializeV2(uint256 _second) external {
        require(!initializedV2,"contract already initialized");
        second = _second;
        initializedV2 = true;
    }

    function returnSecond() external view returns (uint) {
        return second;
    }
}

