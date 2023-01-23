pragma solidity ^0.4.23;
pragma experimental ABIEncoderV2;

contract FOO {
    struct Coordinates {
        uint256 x;
        uint256 y;
    }

    function loopCoords(Coordinates[] coords) public returns (bool) {
        for (uint i = 0; i < coords.length; i++) {
            
        }
        return true;
    }
}
