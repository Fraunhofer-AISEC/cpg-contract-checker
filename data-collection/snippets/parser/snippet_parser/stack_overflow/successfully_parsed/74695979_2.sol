
function safeMint() external {
    if (failedCondition) {
        _mint(msg.sender, tokenId);
    }
}
