struct UserListing {
    address ownerAddress;
    Listing[] list;
}

struct Listing {
    uint listingId;
    ListingStatus status;
    address seller;
    address token;
    uint tokenId;
    uint price;
}

uint private _listingId = 0;

mapping(uint => Listing) private _listings;
mapping(address => UserListing) public userListings;

function cancel(uint listingId) public {
    Listing storage listing = _listings[listingId];

    require(msg.sender == listing.seller, "Only seller can cancel listing");
    require(listing.status == ListingStatus.Active, "Listing is not active");

    
    listing.status = ListingStatus.Cancelled;

    userListings[msg.sender].list.push(
        Listing({
            listingId : _listingId,
            status: ListingStatus.Cancelled,
            seller : msg.sender,
            token: listing.token,
            tokenId : listing.tokenId,
            price : listing.price
        })
    );

    IntERC721(listing.token).transferFrom(address(this), msg.sender, listing.tokenId);

    emit Cancel(listingId, listing.seller);
}
