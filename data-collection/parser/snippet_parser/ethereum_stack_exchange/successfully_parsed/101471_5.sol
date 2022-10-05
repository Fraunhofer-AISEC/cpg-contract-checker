contract MyToken is ERC721 {
    function _mint(address to, uint256 tokenId) internal override {
        
        super.mint(to, tokenId);
        
    }
}
