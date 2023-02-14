function encodeNumbers(int256 a, int256 b, int256 c) public pure returns(uint256 encoded) {

        encoded |= uint(a) << 64;

        encoded |= uint(b) << 32;

        encoded |= uint(c);

        return encoded;
    }
    
    function decodeNumber(uint256 encoded) public pure returns (int256 a, int256 b, int256 c) {

        a = int(encoded) >> 64;

        b = (int(encoded) << 192) >> 224;

        c = (int(encoded) << 224) >> 224;
    }
