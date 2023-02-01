contract ERC721Enumerable is ERC721{

    function totalSupply() public view returns (uint256){
        return _allTokens.length;
    }


}

    function _mint(address to, uint256 tokenId) internal override {
       
    }
}
