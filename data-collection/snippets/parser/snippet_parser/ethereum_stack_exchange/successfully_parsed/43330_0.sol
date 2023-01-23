  function _stringToBytes32(string _string)
    internal
    pure
    returns (bytes32 _bytes32)
  {
    require(bytes(_string).length < 33);
    assembly {
      _bytes32 := mload(add(_string, 0x20))
    }
  }

  function _bytes32ToString(bytes32 _bytes32)
    internal
    pure
    returns (string _string)
  {
    assembly {
      let m := mload(0x40)
      mstore(m, 0x20)
      mstore(add(m, 0x20), _bytes32)
      mstore(0x40, add(m, 0x40))
      _string := m
    }
  }
