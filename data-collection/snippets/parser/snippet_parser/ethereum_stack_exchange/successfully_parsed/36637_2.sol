function getArray() external view returns(uint[3] memory result) {
    uint counter = 0;
    for (uint i = 0; i <= 3; i++) {
        result[counter] = i;
        counter++;
    }
}
