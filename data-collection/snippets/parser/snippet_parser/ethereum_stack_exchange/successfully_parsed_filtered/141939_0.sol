function tokenURL(uint256_tokenId) public view override returns (string memory){
    bytes memory dataURI = abi.encodePacked(
        '{',
            '"name":', '"',tweets[_tokenId].name,'",' '"description":' , '"', tweets[_tokenId].description,'"', ',' ,
            '"attributes":', '[', '{', '"trait_type":', '"Upvotes",' , '"value":', Strings.toString(tweets[_tokenId].upvotes), '}',']','}'
    );

    return string (
        abi.encodePacked(
            "data:application/json;base64,",
            base64.encode(dataURI)
        )
    );
}
