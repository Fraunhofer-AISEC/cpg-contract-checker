pragma solidity 0.4.24;

contract Test {
    function encodeNumbers(uint256 a, uint256 b, uint256 c) public view returns(uint256 encoded) {
        encoded |= (a << 64);
        encoded |= (b << 32);
        encoded |= (c);
        return encoded;
    }

    function decodeNumber(uint256 encoded) public view returns (uint256 a, uint256 b, uint256 c) {
        a = encoded >> 64;
        b = (encoded << 192) >> 224;
        c = (encoded << 224) >> 224;
        return;
    }


}
