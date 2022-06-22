function foo(string memory a, string memory b) public view returns (string memory) {
    bytes memory data1 = bytes(a);
    bytes memory data2 = bytes(b);
    bytes memory data = abi.encode(data1, data2);
    return bar(data);
}

function bar(bytes memory data) public view returns (string memory) {
    (bytes memory data1_recovered, bytes memory data2_recovered) = abi.decode(data, (bytes, bytes));
    return string(abi.encodePacked(data2_recovered, " ", data1_recovered));
}
