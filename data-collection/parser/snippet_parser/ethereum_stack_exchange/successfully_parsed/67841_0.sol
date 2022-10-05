contract MyCollectable is ERC721Full {

constructor (string memory _name, string memory _symbol) public
    ERC721Full(_name, _symbol) {
}



function mintUniqueTokenTo(address _to, uint256 _tokenId, string memory _tokenURI)  
    public {
        super._mint(_to, _tokenId);
        super._setTokenURI(_tokenId, _tokenURI);
    }
}
