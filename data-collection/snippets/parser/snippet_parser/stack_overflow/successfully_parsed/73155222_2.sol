 function hash(Offer memory offer) public pure returns (bytes32) {
        return keccak256(abi.encode(
            OFFER_TYPEHASH,
            offer.from,
            offer.to,
            offer.nonce,
            keccak256(abi.encode(offer.tokenIds)),
            offer.duration
        ));
    }

