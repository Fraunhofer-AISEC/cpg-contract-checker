function random() private returns(uint){
    uint source = block.difficulty + now;
    bytes memory source_b = toBytes(source);
    return uint(keccak256(source_b));
}

function toBytes(uint256 x) public returns (bytes memory b) {
    b = new bytes(32);
    assembly { mstore(add(b, 32), x) }
}
