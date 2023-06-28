function mintNFTs(uint _count) public payable {
    uint totalMinted = _tokenIdCounter.current();
    
    require(totalMinted.add(_count) <= MAX_SUPPLY, "Not enough NFTs left!");
    require(_count >0 && _count <= MAX_PER_MINT, "Cannot mint specified number of NFTs.");
    require(msg.value >= PRICE.mul(_count), "Not enough ether to purchase NFTs.");
    for (uint i = 0; i < _count; i++) {
        _mintSingleNFT();
        }
    }
        
function _mintSingleNFT() private {
    uint newTokenID = _tokenIdCounter.current();
        _safeMint(msg.sender, newTokenID);
        _tokenIdCounter.increment();
}
