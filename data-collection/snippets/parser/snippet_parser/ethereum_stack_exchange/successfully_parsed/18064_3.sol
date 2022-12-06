function getAssetStructById(uint256 assetId) constant returns (
uint256 assetId,
uint256 next,
uint256 prev,
uint256 timestampCreation,
address assetOwner,
address issuer,
string content,
uint256 sellPrice,
assetState state
) {
    return (assetsById[assetId].assetId, );
}
