contract MarketPlace {

    struct Offer {
        bytes32 id;
        uint256 priceInWei;
        uint256 createdAt;
        address seller;
        address buyer;
        string itemName;
        bool isActive;
    }

    mapping(bytes32 => Offer) public offers;

    event OfferCreated(bytes32 id, uint256 price, uint256 createdAt);

    event OfferBought(bytes32 id, address buyer, uint256 boughtAt);

    function createOffer(uint256 _priceInWei, string memory _name) external returns(bytes32 offerHash) {

        require(_priceInWei > 0, "Amount must be positive");
        require(keccak256(abi.encodePacked(_name)) != keccak256(""), "Offer should have a valid name");

        offerHash = generateOfferHash(_priceInWei, _name);

        Offer memory offer = Offer(offerHash, _priceInWei, block.timestamp, msg.sender, address(0), _name, true);
        
        offers[offerHash] = offer;

        emit OfferCreated(offerHash, _priceInWei, block.timestamp);
    }

    function generateOfferHash(uint256 _priceInWei, string memory _name) internal view returns(bytes32) {
        
        
        return keccak256(abi.encodePacked(
            _priceInWei,
            block.timestamp,
            msg.sender,
            _name
        ));
    }

    function acceptOffer(bytes32 _offerId) external payable {
        address buyer = msg.sender;
        Offer storage offer = offers[_offerId];
        require(offer.isActive, "Offer is not active.");
        require(offer.seller != buyer, "You can not buy your own product.");
        require(msg.value == offer.priceInWei, "Please pay the item's price.");

        offer.buyer = buyer;
        offer.isActive = false;

        emit OfferBought(_offerId, buyer, block.timestamp);
    }

}
