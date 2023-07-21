    mapping (uint256 => uint256) listing;
    
    function getPrice(uint256 tokenId) {
        
        return listing[tokenId];
    }
