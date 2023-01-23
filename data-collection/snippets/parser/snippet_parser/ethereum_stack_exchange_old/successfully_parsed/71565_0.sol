  function ecmul(uint256 x, uint256 y, uint256 scalar) public constant returns(uint256[2] p) {
    
    uint256[3] memory input;
    input[0] = bx;
    input[1] = by;
    input[2] = scalar;
    assembly {
      
      if iszero(call(not(0), 0x07, 0, input, 0x60, p, 0x40)) {
        revert(0, 0)
      }
    }
  }
