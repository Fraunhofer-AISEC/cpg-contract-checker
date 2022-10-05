
pragma solidity 0.8.0;

contract Learning{

    bytes8 theKey = 0x3fcb875f0000ddc4;

    function cast32() public view returns (uint32) {
        return uint32(uint64(theKey));
    }

    function cast16() public view returns (uint16) {
        return uint16(uint64(theKey));
    }

}
