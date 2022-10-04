function someMethod() external view
    returns (
        bool someValue,
        uint256 lastIndex,
        uint256 totalTokens
    ) {
    address owner = msg.sender;
    uint256 tokensForOwner = ERC721.balanceOf(owner);

    for (uint256 i = 0; i < tokensForOwner; i++) {
        uint256 tokenId = tokenOfOwnerByIndex(owner, i);
        if (someValue[tokenId] > 0) {
            return (true, i, tokensForOwner);
        }
    }

    return (true, tokensForOwner);
  }
