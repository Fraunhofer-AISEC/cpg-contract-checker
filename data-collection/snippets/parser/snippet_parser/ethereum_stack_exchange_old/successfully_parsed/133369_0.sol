
pragma solidity >=0.4.22 <0.9.0;

contract MarketPlace {
    uint256 public offerCount = 0;

    struct Offer {
        uint256 id;
        uint256 priceInEther;
        uint256 createdAt;
        address seller;
        address buyer;
        string itemName;
        bool isActive;
    }

    mapping(uint256 => Offer) public offers;

    event OfferCreated(uint256 id, uint256 price, uint256 createdAt);

    event OfferBought(uint256 id, address buyer, uint256 boughtAt);

    function createOffer(uint256 _priceInEther, string memory _name) external {
        require(_priceInEther > 0, "Amount must be positive");

        uint256 id = offerCount++;

        offers[id].id = id;
        offers[id].priceInEther = _priceInEther;
        offers[id].createdAt = block.timestamp;
        offers[id].seller = msg.sender;
        offers[id].itemName = _name;
        offers[id].isActive = true;

        emit OfferCreated(id, _priceInEther, block.timestamp);
    }

    function acceptOffer(uint256 _offerId) external payable {
        address buyer = msg.sender;
        require(offers[_offerId].isActive == true, "Offer is not active.");
        require(offers[_offerId].seller != buyer, "You can not buy your own product.");
        require(msg.value == offers[_offerId].priceInEther, "Please pay the item's price.");

        offers[_offerId].buyer = buyer;
        offers[_offerId].isActive = false;

        emit OfferBought(_offerId, buyer, block.timestamp);
    }
}
