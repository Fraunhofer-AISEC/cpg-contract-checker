function encodeWithSignature(uint256 time) public view returns (bytes memory) {
    return abi.encodeWithSignature("setTime(uint256)", time);
}
