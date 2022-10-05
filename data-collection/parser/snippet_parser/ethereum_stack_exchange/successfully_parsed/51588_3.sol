function extractId (bytes data) public pure returns(string) {
    bytes12 out;
    for (uint i = 0; i < 12; i++) {
        out |= bytes12(data[i] & 0xFF) >> (i * 8);
    }
    bytes memory returnValue = new bytes(12);
    for (uint j = 0; j < 12; j++) {
        returnValue[j] = out[j];
    }
    return string(returnValue);
}
