event RoundStarted(uint256 closingBlock);

function roundStart() public ownerOnly {
    RoundStarted(block.number + ROUND_LENGTH);
}
