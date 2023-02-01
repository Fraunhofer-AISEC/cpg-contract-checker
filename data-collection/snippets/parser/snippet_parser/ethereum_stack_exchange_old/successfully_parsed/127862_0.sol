function createCollectible(
    string memory _tokenURI,
    string memory _TIER,
    string memory _BREED_COUNT,
    string memory _AGILITY,
    string memory _WEIGHT,
    string memory _STAMINA,
    string memory _HEALTH,
    string memory _LUCK
) public returns (uint256) {
    uint256 newTokenId = tokenCounter;
    _safeMint(msg.sender, newTokenId);
    _setTokenURI(newTokenId, _tokenURI);
    NFTList[newTokenId] = dog(
        msg.sender,
        block.timestamp,
        _TIER,
        _BREED_COUNT,
        _AGILITY,
        _WEIGHT,
        _STAMINA,
        _HEALTH,
        _LUCK,
        _tokenURI
    );
    tokenCounter = tokenCounter + 1;
    emit CreateCollectible(
        msg.sender,
        block.timestamp,
        _TIER,
        _BREED_COUNT,
        _AGILITY,
        _WEIGHT,
        _STAMINA,
        _HEALTH,
        _LUCK,
        newTokenId
    );
    return newTokenId;
}
