function mint(address _to, uint256 _amount, string memory _tokenURI) public{
        require(hasRole(DEFAULT_ADMIN_ROLE, msg.sender), "Only Admin can call this function!");
        tokenId += 1;
        s_supply[tokenId] += _amount;
        s_tokenIdToURI[tokenId] = _tokenURI;
        _mint(_to, tokenId, _amount, "");
        emit NftMinted(_to, tokenId, _amount, _tokenURI);
    }
