event TokenLaunched (
    uint256 timestamp,
    uint256 id
);

function launchToken(uint256 id) external {
    _launchToken(id);
    emit TokenLaunched(block.timestamp, id);
}
