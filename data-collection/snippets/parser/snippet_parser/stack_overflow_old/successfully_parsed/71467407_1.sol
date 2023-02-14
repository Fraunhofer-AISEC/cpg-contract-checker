uint256 public mintPrice = 1 ether; 

function safeMint(address to) public payable {
    require(msg.value >= mintPrice, "Not enough ETH to purchase NFT; check price!"); 
    require(maxSupply>0,"Not Enough NFT's");
    uint256 tokenId = _tokenIdCounter.current();
    _safeMint(to, tokenId);
    _tokenIdCounter.increment();
    maxSupply--;
}