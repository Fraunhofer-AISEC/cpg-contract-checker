  function addressToBytes(address i)  returns (bytes by) { 
    by = new bytes(20); 
    assembly { 
      let count := 0 
      let byptr := add(by, 32) 
      loop: 
          jumpi(end, eq(count, 20)) 
          mstore8(byptr, byte(add(count,12), i)) 
          byptr := add(byptr, 1) 
          count := add(count, 1) 
          jump(loop) 
      end: 
    } 
    return by; 
  }
