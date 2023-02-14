
pragma solidity ^0.8.16;

contract Learning {

    uint32 public mask32 = 0x000000000000000000000000ffffffff;
    uint16 public mask16 = 0x0000000000000000000000000000ffff;

    bytes8 public theKey = 0x3fcb875f_0000ddc4;

    uint64 public theKey64 = uint64(theKey);

    function getLast16Bits() public view returns(uint) {
        return theKey64 & mask16;
    }

    function getLast32Bits() public view returns(uint) {
        return theKey64 & mask32;
    }

    function cast32() public view returns (uint32) {
        return uint32(uint64(theKey));
    }

    function cast16() public view returns (uint16) {
        return uint16(uint32(uint64(theKey)));
    }

}
