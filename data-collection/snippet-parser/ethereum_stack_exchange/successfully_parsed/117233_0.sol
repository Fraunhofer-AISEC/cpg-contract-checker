 function bytesToUint(bytes memory data) private pure returns (uint256) {
        require(data.length <= 32, "Invalid data length");
        uint256 result = 0;
        for (uint256 index = 0; index < data.length; index++) {
            result = result << 8;
            result += uint8(data[index]);
        }
        return result;
    }
