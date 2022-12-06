

function toString(address input) internal pure returns (string) {
    bytes memory byteArray = new bytes(20);
    for (uint i = 0; i < 20; i++) {
        byteArray[i] = byte(uint8(uint(input) / (2**(8*(19 - i)))));
    }
    return string(byteArray);
}
