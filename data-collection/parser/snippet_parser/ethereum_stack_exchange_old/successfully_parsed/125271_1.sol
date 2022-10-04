function test() public view returns(uint256 freeMemoryPointer) {
    assembly {
        freeMemoryPointer := mload(0x40)
    }
}
