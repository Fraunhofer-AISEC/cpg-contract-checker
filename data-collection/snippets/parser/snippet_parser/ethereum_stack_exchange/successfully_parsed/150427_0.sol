struct MyStruct {
    string data;
    address issuer;
}

function getHash(MyStruct calldata myStruct) public pure returns (bytes32) {
    return keccak256(abi.encode(myStruct));
}
