pragma solidity ^0.8.15;

abstract contract MagicSlot {
  uint256 internal constant _MAGIC_SLOT = 0xcafef00dcafef00dcafef00dcafef00dcafef00dcafef00dcafef00dcafef00d;

  function _magic() internal pure returns (string storage result) {
    assembly ("memory-safe") {
      result.slot := _MAGIC_SLOT
    }
  }

  function magic() external view returns (string memory) {
    return _magic();
  }
}

contract Fails is MagicSlot {
  function setMagic(string memory newValue) public {
    
    
    _magic() = newValue;
  }
}

contract AlsoFails is MagicSlot {
  function setMagic(string memory newValue) public {
    string storage magicRef = _magic();
    
    magicRef = newValue;
  }
}
