function addByteCode(bytes memory input, uint256 index) public {
    require(byteCode[index] != 0, "memory not avalible here");
    byteCode[index] = input;
}
