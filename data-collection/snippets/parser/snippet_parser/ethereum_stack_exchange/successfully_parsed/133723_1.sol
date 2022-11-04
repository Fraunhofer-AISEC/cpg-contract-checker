function setRoyaltyInfo(address _receiver, uint96 _royaltyFeesInBips) public onlyOwner returns(string memory example) {
        _setDefaultRoyalty(_receiver, _royaltyFeesInBips);
        uint256 tender = _tokenIds.current();
        for(uint i=0; i< tender; i++){
            if (Tokens.tokenId != specroyalties) {
                Tokens.Royalties = _royaltyFeesInBips;
            }
            else {
                return("this is wrong");
            }

        }

    }

