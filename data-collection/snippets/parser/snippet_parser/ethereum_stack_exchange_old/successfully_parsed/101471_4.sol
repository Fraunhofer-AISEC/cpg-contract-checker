contract MyToken is ERC721 {
    function _safeMint(address to, uint256 tokenId, bytes memory _data) internal override {
        
        super._safeMint(to, tokenId, _data);
        
    }
}
