function test() public pure returns(bytes32){
    bytes memory a = new bytes(32);
    return keccak256(a);
}
