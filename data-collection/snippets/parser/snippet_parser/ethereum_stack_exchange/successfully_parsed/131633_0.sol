contract mint is ERC721URIStorage, BaseRelayRecipient {
string private greeting;
uint256 tokenId;

constructor() ERC721("GameItem", "ITM") {
    tokenId = 1;
}

function getTokenId() public view returns (uint256) {
    return tokenId;
}

function mintToken() public returns (uint256) {
    _mint(_msgSender(), tokenId);
    tokenId += 1;
    return tokenId;
}
}