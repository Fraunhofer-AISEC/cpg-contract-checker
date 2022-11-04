function concat(string[] memory words) internal pure returns (string memory) {
    
    uint256 bytesLength;
    for (uint256 i = 0; i < words.length; i++) {
        bytesLength += bytes(words[i]).length;
    }

    bytes memory output = new bytes(bytesLength);
    uint256 currentByte;

    for (uint256 i = 0; i < words.length; i++) {
        bytes memory bytesWord = bytes(words[i]);
        for (uint256 j = 0; j < bytesWord.length; j++) {
            output[currentByte] = bytesWord[j];
            currentByte++;
        }
    }

    return string(output);
}
