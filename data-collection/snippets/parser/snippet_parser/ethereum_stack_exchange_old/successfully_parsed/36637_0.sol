function getArray() external view returns(uint[] memory result) {
    uint counter = 0;
    result = new uint[](3);
    for (uint i = 0; i <= 3; i++) {
        result[counter] = i;
        counter++;
    }
}
