pragma solidity^0.4.11;

contract Packing {

    function pack(uint16 a, uint16 b) public pure returns(uint32) {
        return (uint32(a) << 16) | uint32(b);
    }

    function unpack(uint32 c) public pure returns(uint16 a, uint16 b) {
        a = uint16(c >> 16);
        b = uint16(c);
    }
}
