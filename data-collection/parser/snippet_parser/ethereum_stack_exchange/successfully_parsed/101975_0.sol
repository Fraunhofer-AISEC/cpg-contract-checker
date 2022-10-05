mapping(string => bool) _tokenExists;

function test(string memory _str) public {
    _tokenExists[_str] = true;
}
