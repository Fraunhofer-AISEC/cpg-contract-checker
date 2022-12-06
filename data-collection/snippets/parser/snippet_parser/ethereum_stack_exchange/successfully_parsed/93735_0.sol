
constructor(Move memory move) payable {
    require(msg.value > 0, "Player 1 must bet a positive amount.");
    bytes32 hashedMove = keccak256(abi.encodePacked(move));
    emit MoveCommit(msg.sender, hashedMove);
}
