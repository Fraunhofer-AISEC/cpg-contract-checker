    function Deploy() public returns(uint) {
        bytes memory code = "\x60\x0a\x60\x0c\x60\x00\x39\x60\x20\x60\x00\xf3\x60\x42\x60\x80\x52\x60\x20\x60\x80\xf3";

        address addr;
        uint size;
        assembly {
          addr := create(0, add(code, 0x20), mload(code))
          size := extcodesize(addr)
          if iszero(extcodesize(addr)) {
            revert(0, 0)
          }
        }
        return size;
    }
