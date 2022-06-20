

pragma solidity >=0.7.0 < 0.9.0;

contract Untitled {
    
    event Numbers(int256 i, int256 j, int256 k);
    
    function foo() public returns (uint256) {
        int256 x = -123;
        int256 y = 8545;
        int256 z = -42;
        
        uint256 encoded = encodeNumbers(x, y, z);
        (int256 r, int256 s, int256 t) = decodeNumber(encoded);
        emit Numbers(r, s, t);
        
        return encoded;
    }
    
    function encodeNumbers(int256 a, int256 b, int256 c) public pure returns(uint256 encoded) {
        encoded |= uint256(uint32(int32(a))) << 64;
        encoded |= uint256(uint32(int32(b))) << 32;
        encoded |= uint256(uint32(int32(c)));

        return encoded;
    }
    
    function decodeNumber(uint256 encoded) public pure returns (int256 a, int256 b, int256 c) {
        a = int256(int32(uint32(encoded >> 64)));
        b = int256(int32(uint32(encoded >> 32)));
        c = int256(int32(uint32(encoded)));
    } 
    
}
