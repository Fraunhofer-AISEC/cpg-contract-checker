function tokenURI(uint256 tokenId)
    public
    view
    override
    returns (string memory)
{
    require(_exists(tokenId), "Token URI query for nonexistent token!");
    if(revealed == true) {
        return string(abi.encodePacked(BASE_URI, "/", Strings.toString(tokenId), ".json"));
    } else {
        return string(abi.encodePacked(BASE_URI, DEFAULT_METADATA));
    }
}
