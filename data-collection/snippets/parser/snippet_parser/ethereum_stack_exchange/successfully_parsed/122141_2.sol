function encodePacked(uint256 time) public view returns (bytes memory) {
    return abi.encodePacked(setTimeSignature, time);
}



function encode(uint256 time) public view returns (bytes memory) {
    return abi.encode(setTimeSignature, time);
}


