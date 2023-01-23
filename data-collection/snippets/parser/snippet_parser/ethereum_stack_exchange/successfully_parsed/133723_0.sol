 function specificroyalty(uint256 _tokenId, address _receiver, uint96 _royaltyFeesInBips) public onlyOwner {
        _setTokenRoyalty(_tokenId, _receiver, _royaltyFeesInBips);
        idTokens[_tokenId].Royalties = _royaltyFeesInBips;
        specroyalties.push(_tokenId);
    }



    struct Tokens {
      uint256 tokenId;
      address  nftAddress;
      address  currentOwner;
      uint256 price;
      uint256 copies;
      bool forSale;
      uint256 Royalties;
    }

    mapping(uint256 => Tokens) private idTokens;
