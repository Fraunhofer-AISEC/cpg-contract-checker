mapping(bytes32 => bool) _tokenExists;

function test(string memory _str) public {
    _tokenExists[abi.encodePacked(_str)] = true;
}
