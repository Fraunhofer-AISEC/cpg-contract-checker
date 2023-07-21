contract Foo {
    
    mapping (uint256 => uint256) listing;
    
    mapping (uint256 => address) listings;
    
    function getPrice(uint256 tokenId) {
        require(listings[tokenId] != address(0), "LISTING_NOT_FOUND");
        
        return listing[tokenId];
    }
    function createListing (uint256 tokenId, address token, uint256 price) public onlyOwner {
        listings[tokenId] = token;
        
        listing[tokenId] = price;
    }
    
}
