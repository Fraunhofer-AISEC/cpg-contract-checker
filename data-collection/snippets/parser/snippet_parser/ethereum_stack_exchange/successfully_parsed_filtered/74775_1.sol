function shuffle() external {
    for (uint256 i = 0; i < numberArr.length; i++) {
        uint256 n = i + uint256(keccak256(abi.encodePacked(block.timestamp))) % (numberArr.length - i);
        uint256 temp = numberArr[n];
        numberArr[n] = numberArr[i];
        numberArr[i] = temp;
    }
}
