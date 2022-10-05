contract SampleToken is ERC721MetadataMintable {
    string private name;
    string private symbol;
    constructor (address _creator, string _name, string _symbol, string _tokenURI)
    ERC721MetadataMintable()
    ERC721Metadata(_name, _symbol) public {
        uint256 _tokenId = 0;
        mintWithTokenURI(_creator, _tokenId, _tokenURI);
    }
}
