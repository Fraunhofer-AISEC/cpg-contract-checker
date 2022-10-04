contract NFTMarketplace{

   enum ListingStatus {
    Active,
    Sold,
    Cancelled
}

struct Listing {
    ListingStatus status;
    address seller;
    address token;
    uint tokenId;
    uint price;
}

event Listed(
    ***
);

event Sale(
    ***
);

event Cancel(
    ***
);

uint private _listingId = 0;
mapping(uint => Listing) private _listings;

function listToken(address token, uint tokenId, uint price) external {

    ERC721(token).transferFrom(msg.sender, address(this), tokenId);
    
    Listing memory listing = Listing(
        ListingStatus.Active,
        msg.sender,
        token,
        tokenId,
        price
    );

    _listingId++;

    _listings[_listingId] = listing;

    emit Listed(
        ***
    );
}

function getStatus(uint listingId) public view returns (ListingStatus ) {
Listing storage listing = _listings[listingId];
    return listing.status;
}

function getListing(uint listingId) public view returns (Listing memory) {
    return _listings[listingId];
}

function buyToken(uint listingId) public payable {
    Listing storage listing = _listings[listingId];

    require(msg.sender != listing.seller, "Seller cannot be buyer");
    require(listing.status == ListingStatus.Active, "Listing is not active");

    require(msg.value >= listing.price, "Insufficient payment");

    listing.status = ListingStatus.Sold;

    ERC721(listing.token).transferFrom(address(this), msg.sender, listing.tokenId);
    payable(listing.seller).transfer(listing.price);

    emit Sale(
        ***
    );
}

function cancel(uint listingId) public {
    Listing storage listing = _listings[listingId];

    require(msg.sender == listing.seller, "Only seller can cancel listing");
    require(listing.status == ListingStatus.Active, "Listing is not active");

    listing.status = ListingStatus.Cancelled;

    ERC721(listing.token).transferFrom(address(this), msg.sender, listing.tokenId);

    emit Cancel(***);
}
}
