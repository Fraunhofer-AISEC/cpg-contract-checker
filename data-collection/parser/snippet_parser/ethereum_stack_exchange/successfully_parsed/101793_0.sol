
function safeExecuteOrder(
    address _nftAddress,
    uint256 _assetId,
    uint256 _priceInWei,
    bytes32 _fingerprint
)
    public whenNotPaused
{
    
    Order memory order = _getValidOrder(
        _nftAddress,
        _assetId
    );

    
    require(order.price == _priceInWei, "Marketplace: invalid price");
    require(order.seller != msg.sender, "Marketplace: unauthorized sender");

    
    _verifyAssetFingerprint(
        IERC721Verifiable(_nftAddress),
        _assetId,
        _fingerprint
    );

    
    uint256 saleShareAmount = 0;

    
    if (FeeManager.cutPerMillion > 0) {
        
        saleShareAmount = _priceInWei
            .mul(FeeManager.cutPerMillion)
            .div(1e6);

        
        acceptedToken.safeTransferFrom(
            msg.sender, 
            owner(),
            saleShareAmount
        );
    }

    
    acceptedToken.safeTransferFrom(
        msg.sender, 
        order.seller, 
        order.price.sub(saleShareAmount)
    );

    
    Bid memory bid = bidByOrderId[_nftAddress][_assetId];

    if (bid.id != 0) {
        _cancelBid(
            bid.id,
            _nftAddress,
            _assetId,
            bid.bidder,
            bid.price
        );
    }

    _executeOrder(
        order.id,
        msg.sender, 
        _nftAddress,
        _assetId,
        _priceInWei
    );
}
