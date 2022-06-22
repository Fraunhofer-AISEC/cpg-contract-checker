function getBytecode(address _owner, uint _foo) public pure returns (bytes memory) {
    bytes memory bytecode = type(TestContract).creationCode;

    return abi.encodePacked(bytecode, abi.encode(_owner, _foo));
}
