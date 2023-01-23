function getMyNTokenURIs() public view returns(string[] memory NFTs) {
        uint256[] memory tokenIds = getMyTokenIds();
        uint256 tokenIdsCount = tokenIds.length;

        NFTs = new string[](tokenIdsCount);

        for (uint256 i = 0; i < tokenIdsCount; i++) {
            NFTs[i] = nftInstance.tokenURI(tokenIds[i]);
        }

        return NFTs;
    }
