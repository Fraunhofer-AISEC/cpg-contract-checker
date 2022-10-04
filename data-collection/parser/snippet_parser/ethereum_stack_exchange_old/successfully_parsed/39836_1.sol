   function _ownerOf(uint _tokenId)
        internal
        view
        returns (address _owner)
    {
        return tokenIdToOwner[_tokenId];
    }
