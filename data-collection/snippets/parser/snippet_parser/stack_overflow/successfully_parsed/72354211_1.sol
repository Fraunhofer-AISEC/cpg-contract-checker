   function update(
        uint256 tokenId,
        Profile memory profile
    ) public authorise(tokenId) {
        array[tokenId] = profile;
    }
