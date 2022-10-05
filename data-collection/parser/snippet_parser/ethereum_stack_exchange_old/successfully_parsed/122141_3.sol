function encodePacked(uint256 time) public view returns (bytes memory) {
    return abi.encodePacked(setTimeSignature, time);
}

function encodeHybrid(uint256 time) public view returns (bytes memory) {
    return abi.encodePacked(abi.encodePacked(setTimeSignature), abi.encode(time));
}

function encodeHybrid2(uint256 time) public view returns (bytes memory) {
    return abi.encodePacked(abi.encodePacked(setTimeSignature), abi.encodePacked(time));
}
