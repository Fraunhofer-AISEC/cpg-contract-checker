function appendString(string memory _a, string memory _b, string memory _c) internal pure returns (string memory)  {
    return string(abi.encodePacked(_a, _b, _c));
}
