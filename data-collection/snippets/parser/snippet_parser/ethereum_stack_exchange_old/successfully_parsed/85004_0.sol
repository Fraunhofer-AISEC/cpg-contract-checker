function random() private view returns(uint){
    return uint(keccak256(abi.encodePacked(block.difficulty, now, number)));
}
