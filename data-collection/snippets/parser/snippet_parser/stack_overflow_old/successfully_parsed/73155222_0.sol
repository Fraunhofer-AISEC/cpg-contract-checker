     struct Offer{
        address from;
        address to;
        uint256 nonce;
        uint256[] tokenIds;
        uint256 duration;
    }

    bytes32 constant EIP712DOMAIN_TYPEHASH = keccak256(
        "EIP712Domain(string name,string version,uint256 chainId,address verifyingContract)"
    );

    bytes32 constant OFFER_TYPEHASH = keccak256(
        "Offer(address from,address to,uint256 nonce,uint256[] memory tokenIds,uint256 duration)"
    );

    function hash(Offer memory offer) public pure returns (bytes32) {
        return keccak256(abi.encode(
            OFFER_TYPEHASH,
            offer.from,
            offer.to,
            offer.nonce,
            keccak256(abi.encodePacked(offer.tokenIds)),
            offer.duration
        ));
    }

 function verify(Offer memory offer, uint8 v, bytes32 r, bytes32 s) public view returns (bool) {
        
        bytes32 digest = keccak256(abi.encodePacked(
            "\x19\x01",
            DOMAIN_SEPARATOR,
            hash(offer)
        ));
        return ecrecover(digest, v, r, s) == ExpectedAddress;
    }
