pragma solidity ^0.4.17;

contract CoordinateUtils {
    function coordinatesToBytes32(int16 x, int16 y) internal pure returns(bytes32) {
        return (bytes32(x) << 16 & 0xFFFFFFFF) | bytes16(y);  
    }
    function bytes32ToCoordinates(bytes32 b) internal pure returns(int16 x, int16 y) {
        return (int16(b >> 16), int16(b));
    }
}
