contract Market is OwnableUpgradeable, ReentrancyGuardUpgradeable {
 function _createListing(
    address nftAddress,
    uint256 tokenId,
    address _listingTokenAddress,
    string calldata _listingTokenName,
    string calldata _listingTokenSymbol,
    uint256 price,
    uint256 expiration
) internal {
    require(nftAddress != address(0), "zero address");
    require(price > 0, "zero amount");
    IERC721Upgradeable(nftAddress).transferFrom( 
        msg.sender,
        address(this),
        tokenId
    );
    PropertyListing memory _propertyListing = PropertyListing(
        nftAddress,
        tokenId,
        price,
        _listingTokenAddress,
        _listingTokenName,
        _listingTokenSymbol,
        msg.sender,
        expiration,
        true,
        false
    );
    listings.push(_propertyListing);
    uint256 _id = listings.length - 1;
    emit NewPropertyListing(
        _id,
        nftAddress,
        tokenId,
        price,
        _listingTokenAddress,
        _listingTokenName,
        _listingTokenSymbol,
        msg.sender,
        expiration,
        true,
        false
    );
}
}
