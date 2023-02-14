
function safeMint() external {
    require(failedCondition);
    _mint(msg.sender, tokenId);
}
