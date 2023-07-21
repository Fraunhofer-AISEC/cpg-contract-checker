 function convert(bytes32 foo) public pure returns(string memory) {
    string memory bar = string(abi.encodePacked(foo));
    return bar;
 }
