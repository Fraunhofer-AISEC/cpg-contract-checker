
pragma solidity ^0.8.2;

library TestLibrary {
    function sz_varint(uint256 i) internal pure returns (uint256) {
        uint256 count = 1;
        assembly {
            i := shr(7, i)
            for {} gt(i, 0) {} {
                i := shr(7, i)
                count := add(count, 1)
            }
        }
        return count;
    }

    function encode_varint_assembly(uint256 x, uint256 p, bytes memory bs) internal pure returns (uint256) {
        uint256 sz = 0;
        assembly {
            let bsptr := add(bs, p)
            let byt := and(x, 0x7f)
            for {} gt(shr(7, x), 0) {} {
                mstore8(bsptr, or(0x80, byt))
                bsptr := add(bsptr, 1)
                sz := add(sz, 1)
                x := shr(7, x)
                byt := and(x, 0x7f)
            }
            mstore8(bsptr, byt)
            sz := add(sz, 1)
        }
        return sz;
    }
    function encode_varint_assembly_nomstore8(uint256 x, uint256 p, bytes memory bs) internal pure returns (uint256) {
        uint256 sz = 0;
        assembly {
            let bsptr := add(bs, p)
            let byt := and(x, 0x7f)
            for {} gt(shr(7, x), 0) {} {
                
                bsptr := add(bsptr, 1)
                sz := add(sz, 1)
                x := shr(7, x)
                byt := and(x, 0x7f)
            }
            
            sz := add(sz, 1)
        }
        return sz;
    }
    function encode_varint(uint256 x, uint256 p, bytes memory bs) internal pure returns (uint256) {
        uint256 tmp = x;
        uint256 idx = p;
        bytes1 byt = bytes1(uint8(tmp & 0x7f));
        while (tmp > 0x7f) {
            bs[idx] = byt | 0x80;
            tmp = tmp >> 7;
            byt = bytes1(uint8(tmp & 0x7f));
            idx += 1;
        }
        bs[idx] = byt;
        return idx - p + 1;
    }
}

contract TestContract {
    function encode_varint_assembly(uint256 x) public pure returns(bytes memory) {
        uint256 sz = TestLibrary.sz_varint(x);
        bytes memory buffer = new bytes(sz);
        TestLibrary.encode_varint_assembly(x, 0, buffer);
        return buffer;
    }
    function encode_varint_assembly_nomstore8(uint256 x) public pure returns(bytes memory) {
        uint256 sz = TestLibrary.sz_varint(x);
        bytes memory buffer = new bytes(sz);
        TestLibrary.encode_varint_assembly_nomstore8(x, 0, buffer);
        return buffer;
    }
    function encode_varint(uint256 x) public pure returns(bytes memory) {
        uint256 sz = TestLibrary.sz_varint(x);
        bytes memory buffer = new bytes(sz);
        TestLibrary.encode_varint(x, 0, buffer);
        return buffer;
    }
}
