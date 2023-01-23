function mint(uint256 tokenId) public onlyElevated whenNotPaused returns (uint256) {
    require(totalSupply() < TOTAL_SUPPLY, "Max supply reached");
    _mint(msg.sender, tokenId);
    return tokenId;
}
