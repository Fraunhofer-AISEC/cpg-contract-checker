 function extractSig (bytes data, uint8 from, uint8 n) public constant returns(bytes) {
      bytes memory returnValue = new bytes(n);
      for (uint8 i = from; i < n; i++) {
        returnValue[i] = data[i];
      }
      return returnValue;
    }
