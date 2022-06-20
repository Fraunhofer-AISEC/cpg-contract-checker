function toBytes(address a) constant returns (bytes b){
  assembly {
      let m := mload(0x40)
      mstore(add(m, 20), xor(0x140000000000000000000000000000000000000000, a))
      mstore(0x40, add(m, 52))
      b := m
  }
}

function checkAddress(bytes data, address toCheck) constant returns (bool){
    bytes memory addBytes = toBytes(toCheck);
    for(uint i = data.length - 20; i < data.length; i++) {
        if (data[i] != addBytes[i - data.length + 20]) {
            return false;
        }
    }
    return true;
  }
