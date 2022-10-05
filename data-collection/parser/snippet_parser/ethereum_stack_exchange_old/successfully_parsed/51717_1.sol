
function (bytes _encodedParam) public returns (address a, uint256 n) {
    uint256 btsptr;
    
    assembly {
        btsptr := add(_encodedParam, 32)
        a := mload(btsptr)
        btsptr := add(_encodedParam, 64)
        n := mload(btsptr)
    }
}
