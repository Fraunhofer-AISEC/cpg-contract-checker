function stringToBytes8(string memory sourceStr) private pure returns(bytes8) {
    bytes8 temp = 0x0;
    assembly {
        temp := mload(add(sourceStr, 32))
    }
    return temp;
}
