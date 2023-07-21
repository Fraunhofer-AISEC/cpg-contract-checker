function setAssetPrice(
        uint256 assetId,
        uint256 newPrice
    ) external onlyOwner {
        require(assetId > 0 && assetId <= assetCount, "Invalid asset ID.");
        Asset storage asset = assets[assetId];
        require(asset.owner != address(0), "Asset does not exist.");
        
        
        asset.pricePerShare = newPrice;

        emit SetAssetPrice(assetId, newPrice);
    }
}
