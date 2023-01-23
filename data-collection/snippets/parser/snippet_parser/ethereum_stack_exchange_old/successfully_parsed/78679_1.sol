contract stringsContract {
        function takesTwo(string memory str, uint idx) public pure returns (byte) {
            bytes memory bytesStr = bytes(str);
            return bytesStr[idx];
        }
    }
