function mint(address receiver) external onlyOwner returns (uint256) {
    _tokenIds.increment();

    uint256 newTokenId = _tokenIds.current();
    _mint(receiver, newTokenId);

    return newTokenId;
}
