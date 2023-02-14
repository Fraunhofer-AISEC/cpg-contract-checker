pragma solidity 0.6.12;

contract MyContract {
    function concatDecDec(uint256 x, address y) external pure returns (string memory) {
        return string(abi.encodePacked(itod(x), itod(uint256(y))));
    }

    function concatDecHex(uint256 x, address y) external pure returns (string memory) {
        return string(abi.encodePacked(itod(x), itoh(uint256(y))));
    }

    function concatHexDec(uint256 x, address y) external pure returns (string memory) {
        return string(abi.encodePacked(itoh(x), itod(uint256(y))));
    }

    function concatHexHex(uint256 x, address y) external pure returns (string memory) {
        return string(abi.encodePacked(itoh(x), itoh(uint256(y))));
    }

    function itod(uint256 x) private pure returns (string memory) {
        if (x > 0) {
            string memory str;
            while (x > 0) {
                str = string(abi.encodePacked(uint8(x % 10 + 48), str));
                x /= 10;
            }
            return str;
        }
        return "0";
    }

    function itoh(uint256 x) private pure returns (string memory) {
        if (x > 0) {
            string memory str;
            while (x > 0) {
                str = string(abi.encodePacked(uint8(x % 16 + (x % 16 < 10 ? 48 : 87)), str));
                x /= 16;
            }
            return str;
        }
        return "0";
    }
}
