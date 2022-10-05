contract Market is ReentrancyGuard {
    using Counters for Counters.Counter;
    Counters.Counter private _listingCount;

    mapping(uint256 => Listing) public marketListings;

    struct Listing {
        uint256 listingId;
        address nftContractAdd;
        uint256 tokenId;
        address ownerAdd;
        uint256 price;
    }

    function getItemsOf (address wallet) public view returns (Listing[] memory) {
        uint resultCount = 0;
        for (uint i = 0; i < _listingCount.current(); i++) {
            if (marketListings[i].ownerAdd == address(wallet)) {
                resultCount++; 
            }
        }

        uint itemCount = 0;
        Listing[] memory items = new Listing[](resultCount);
        for (uint256 i = 0; i <= _listingCount.current(); i++) { 
            if(marketListings[i].ownerAdd == address(wallet)) {
                items[itemCount] = marketListings[i];
                itemCount++;
            }
        }

        return items;
    }
}
