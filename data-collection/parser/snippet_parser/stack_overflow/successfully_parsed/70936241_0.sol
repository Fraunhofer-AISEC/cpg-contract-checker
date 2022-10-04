pragma solidity >=0.5.0;

import "./IERC721.sol";

contract Market {
    
    
    
    

    enum ListingStatus {
        Active,
        Sold,
        Cancelled
    }

    struct Listing{
        ListingStatus status;
        address seller;
        address token;
        uint TokenId;
        uint price;
    }

    event Listed(
        uint listingId,
        address seller,
        address token,
        uint tokenId,
        uint price
    );

    event Sale(
        uint listingId,
        address buyer,
        address token,
        uint TokenId,
        uint price
    );

    event Cancel(
        uint listingId,
        address seller
    );

    uint private _listingId = 0;
    mapping(uint => Listing) private _listings;

    function listToken(address token, uint TokenId, uint price) external {
        IERC721(token).TransferFrom(msg.sender, address(this), TokenId);

        Listing memory listing = Listing(
            ListingStatus.Active,
            msg.sender,
            token,
            TokenId,
            price
        );

        

    _listingId++;

    _listings[_listingId] = listing;

    emit Listed(
        _listingId,
        msg.sender,
        token,
        TokenId,
        price
    );

    }

    
    
    

    function getListing(uint listingId) public view returns (Listing memory){
        return _listings[listingId];
    }

    function buyToken(uint listingId) external payable{
        Listing storage listing = _listings[listingId];

        require(msg.sender != listing.seller, "Seller cannot be the buyer");
        require(listing.status == ListingStatus.Active);

        require(msg.value >= listing.price, "Insufficient Funds");
        

        listing.status = ListingStatus.Sold;

        IERC721(listing.token).TransferFrom(address(this), msg.sender, listing.TokenId);
        payable(listing.seller).transfer(listing.price);

        emit Sale(
            listingId,
            msg.sender,
            listing.token,
            listing.TokenId,
            listing.price
        );
    }

    function cancel(uint listingId) public {
        Listing storage listing = _listings[listingId];

        require(msg.sender == listing.seller, "Only the seller may cancel this listing");
        require(listing.status == ListingStatus.Active, "Listing is not active");

        listing.status = ListingStatus.Cancelled;

        IERC721(listing.token).TransferFrom(address(this), msg.sender, listing.TokenId);

        emit Cancel(listingId, listing.seller);
    }

}
