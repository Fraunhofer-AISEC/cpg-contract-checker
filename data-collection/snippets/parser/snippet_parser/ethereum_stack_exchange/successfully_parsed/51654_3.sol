function extractSig (bytes data, uint8 from, uint8 n) public constant returns(bytes) {
      bytes memory returnValue = new bytes(n);
      for (uint8 i = 0; i < n - from; i++) {
        returnValue[i] = data[i + from]; 
      }
      return returnValue;
    }
