pragma solidity >=0.4.22 <0.6.0;

contract A {

    function test(bytes32 r) public pure returns (bytes8 i, bytes8 j, bytes8 k, bytes8 m) {
        uint256 rr = uint256(r);
        i = bytes8(uint64(rr >> 64*3));
        j = bytes8(uint64(rr >> 64*2));
        k = bytes8(uint64(rr >> 64*1));
        m = bytes8(uint64(rr >> 64*0));
    }

    function bar(bytes32 r) public pure returns (bytes8 i, bytes8 j, bytes8 k, bytes8 m) {
        i = bytes8(r);
        j = bytes8(r << 64*1);
        k = bytes8(r << 64*2);
        m = bytes8(r << 64*3);
    }

    function foo(bytes32 r) public pure returns (bytes8 i, bytes8 j, bytes8 k, bytes8 m) {
        assembly {
            i := r
            j := shl(64, r)
            k := shl(128, r)
            m := shl(192, r)
        }
    }
}
