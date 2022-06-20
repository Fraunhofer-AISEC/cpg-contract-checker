function toUint256(bytes memory _bytes, uint256 _start) internal pure returns (uint256) {
    require(_bytes.length >= _start + 32, "toUint256_outOfBounds");
    uint256 tempUint;

    assembly {
        tempUint := mload(add(add(_bytes, 0x20), _start))
    }

    return tempUint;
}
