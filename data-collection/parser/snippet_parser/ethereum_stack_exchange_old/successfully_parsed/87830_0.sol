function computeAddress2(uint256 salt) public view returns (address) {
    bytes32 _data = keccak256(
        abi.encodePacked(bytes1(0xff), address(this), salt, bytes32(0x3c1644c68e5d6cb380c36d1bf847fdbc0c7ac28030025a2fc5e63cce23c16348))
    );
    return address(uint256(_data));
}

function _destroyChildren(uint256 value) internal {
    uint256 _totalBurned = totalBurned;
    for (uint256 i = 0; i < value; i++) {
        computeAddress2(_totalBurned + i).call("");
    }
    totalBurned = _totalBurned + value;
}
