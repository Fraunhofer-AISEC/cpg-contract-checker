function getArray() external view returns(uint[] memory result) {
    uint[] result;
    for (uint i = 0; i <= 3; i++)
        result.push(i);
}
