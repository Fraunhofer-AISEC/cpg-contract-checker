    CountersUpgradeable.Counter private nonce;

    function mintERC721() ... {
        uint256 tokenId;
        unchecked {
            tokenId = (nonce << 128);
        }
        ...
        nonce.increment();
    }
   
