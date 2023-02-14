pragma solidity ^0.6.3;

contract Test {
    function b32ToU24(bytes32 barray) external pure returns (uint24) {
        return uint24(bytes3(barray << 24));
    }

    function b32ToU24ASM(bytes32 barray) external pure returns (uint24) {
        uint24 result;

        assembly {
            
            
            result := shr(0xd0, barray)
        }

        return result;
    }
}
