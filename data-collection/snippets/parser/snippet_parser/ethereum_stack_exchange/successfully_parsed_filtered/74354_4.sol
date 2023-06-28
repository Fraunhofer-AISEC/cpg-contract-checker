function bytes256ToString(byte[256] memory x) public pure returns (string memory) {
        bytes memory bytesString = new bytes(256);
        uint charCount = 0;
        for (uint j = 0; j < 256; j++) {
            byte char = x[j];
            if (char != 0) {
                bytesString[charCount] = char;
                charCount++;
            }
        }
        bytes memory bytesStringTrimmed = new bytes(charCount);
        for (uint j = 0; j < charCount; j++) {
            bytesStringTrimmed[j] = bytesString[j];
        }
        return string(bytesStringTrimmed);
    }
