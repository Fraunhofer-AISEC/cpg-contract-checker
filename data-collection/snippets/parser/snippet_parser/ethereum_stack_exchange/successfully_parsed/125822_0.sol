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

  uint256[48] private ______gap;
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

