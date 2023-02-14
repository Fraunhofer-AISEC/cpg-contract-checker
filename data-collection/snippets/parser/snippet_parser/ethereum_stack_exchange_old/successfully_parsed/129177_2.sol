    function changeURI(uint256 _tokenId)
    public
    returns(string memory)
    {
        require(ownerOf(_tokenId) == msg.sender, "You're not the owner of nft");
        STAKED_BASE_URI = "similarly_some_other_uri_that_also_shows_some_data_on_testnetOpensea/" ;
        _setTokenURI(_tokenId, STAKED_BASE_URI);
        emit txDetails(STAKED_BASE_URI, address(this), _tokenId);
        return string(abi.encodePacked(STAKED_BASE_URI, _tokenId.toString(), ".json"));
    }
