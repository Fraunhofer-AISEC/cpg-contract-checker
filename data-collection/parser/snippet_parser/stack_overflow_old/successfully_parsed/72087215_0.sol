 function tokenURI(uint256 _tokenId) public view virtual override returns (string memory) {
        require(_exists(_tokenId), 'ERC721Metadata: URI query for nonexistent token');
        string memory _tokenURI = _tokenURIs[_tokenId];

        if (revealState == false) {
            return hiddenMetadataUri;
        } else {
            return _tokenURI;
        }

    }

     function setTokenURI(uint256 _tokenId) public virtual onlyOwner{
        require(_exists(_tokenId), 'ERC721Metadata: URI query for nonexistent token');
        uint img_no = _tokenId + 1;
        string memory tokenid = Strings.toString(img_no);
        string memory currentBaseURI = _baseURI();
        string memory result = '';

        if (bytes(currentBaseURI).length > 0) {
            result = string(abi.encodePacked(currentBaseURI, tokenid, uriSuffix));
        } else {
            result = string(abi.encodePacked(tokenid, uriSuffix));
        }

        _tokenURIs[_tokenId] = result;
    }
