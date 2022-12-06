    function searchOffers(string memory _itemName) external view returns (offerModel memory) {
        for (uint256 i = 0; i < numberOfOffer; i++) {
            if (keccak256(offers[i].itemName) == keccak256(_itemName)) {
                return offers[i];
            }
        }
    }

    function getAllOffers() external view returns (offerModel[] memory) {
        offerModel[] memory allOffers = new offerModel[](numberOfOffer);
        for (uint256 i; i < numberOfOffer; i++) allOffers[i] = offers[i];
        return allOffers;
    }

