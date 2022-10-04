function getCurrentOwner(uint assetId) constant public returns (address) {
    return assetAddress[assetId];
}
