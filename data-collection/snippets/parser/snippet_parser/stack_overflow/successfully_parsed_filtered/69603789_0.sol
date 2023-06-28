mapping(uint256 => string) private _tokenURIs;
string defaultUri;
string privateKey;

function tokenURI(uint256 tokenId) public view virtual returns (string memory) {
    if (privateKey == "") {
        return defaultUri
    }
    return decrype(_tokenURIs[tokenId], privateKey);
}
