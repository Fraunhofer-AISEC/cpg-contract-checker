 function safeMint(address to, uint256 tokenId) public onlyOwner payable {
    require(msg.value >= mintPrice, "Not enough ETH to purchase NFT; check price!"); 
    _safeMint(to, tokenId);
}
