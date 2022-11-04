function isOwnerOfAsset(address userId, uint assetId) private constant returns(bool) {
    return assetAddress[assetId] == userId? true:false;
}
