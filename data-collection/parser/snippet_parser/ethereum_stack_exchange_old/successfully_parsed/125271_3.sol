
function toSlice(string memory self) internal pure returns (slice memory) {
    uint ptr;
    assembly {
        ptr := add(self, 0x20)
    }
    return slice(bytes(self).length, ptr);
}
