function getRange(uint n) public pure returns(uint[]) {
    uint tookCount = 0;
    uint[] memory result = new uint[](n);
    for (uint i = 0; i < n; i++)
        if (someCondition(i)) {
            result.push(i);
            tookCount++;
        }

    uint[] memory trimmedResult = new uint[](tookCount);
    for (uint j = 0; j < trimmedResult.length; j++) {
        trimmedResult[j] = result[j];
    }
    return trimmedResult;
}
