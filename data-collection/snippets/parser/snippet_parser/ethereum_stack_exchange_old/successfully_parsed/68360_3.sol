function random() private view returns(uint){
    uint source = block.difficulty + now;
    return uint(keccak256(bytes32(source)));
}
