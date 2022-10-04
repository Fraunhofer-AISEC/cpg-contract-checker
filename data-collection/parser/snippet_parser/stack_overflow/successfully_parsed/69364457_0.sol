    function available(uint256 tokenId) public view returns(bool) {
        return expirationTime[tokenId] < now;
    }
