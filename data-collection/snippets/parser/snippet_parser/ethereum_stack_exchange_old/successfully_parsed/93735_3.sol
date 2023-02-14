function commitMove(
    uint256 moveId,
    uint256 salt
) external {
    
    require(
        moveId == 1 || moveId == 2 || moveId == 3,
        "move must be either 1, 2 or 3"
    );
    moves[msg.sender] = keccak256(abi.encodePacked(moveId, salt));
    
}
