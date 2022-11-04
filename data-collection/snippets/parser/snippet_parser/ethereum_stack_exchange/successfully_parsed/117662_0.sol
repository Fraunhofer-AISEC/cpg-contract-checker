function addErc1155Airdrop(
    uint256 airdropId,
    ERC1155 token,
    uint256 tokenId,
    uint256 amount,
    bytes32 merkleRoot,
    uint256 expirationSeconds,
    bool paidable,
    uint256 piecePrice
)
external
{
    require(!isPaused[0], "Paused");

    AirDrop storage airDrop = airDrops[airdropId];
    require(address(airDrop.token) == address(0), "Airdrop already exists");
  

    token.safeTransferFrom(msg.sender, address(this), tokenId, amount, "");
    airDrop.token = token;
    airDrop.tokenId = tokenId;
    airDrop.creator = msg.sender;
    airDrop.merkleRoot = merkleRoot;
    airDrop.amount = amount;
    airDrop.paidable = paidable;
    airDrop.piecePrice = piecePrice;
    
    if (expirationSeconds > 0) {
        airDrop.expirationTimestamp = uint64(block.timestamp + expirationSeconds);
    } else {
        airDrop.expirationTimestamp = uint64(block.timestamp + DEFAULT_AIRDROP_EXPIRATION);
    }
    emit AddedAirdrop(airdropId, token, tokenId, amount, paidable);
}
