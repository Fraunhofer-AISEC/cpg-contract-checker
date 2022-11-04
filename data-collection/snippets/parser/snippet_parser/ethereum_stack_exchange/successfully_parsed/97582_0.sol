function mintNFT(uint256 numberOfNfts) public payable {
    require(totalSupply() < MAX_NFT_SUPPLY, "Sale has already ended");
    require(numberOfNfts > 0, "numberOfNfts cannot be 0");
    require(numberOfNfts <= 20, "You may not buy more than 20 NFTs at once");
    require(totalSupply().add(numberOfNfts) <= MAX_NFT_SUPPLY, "Exceeds MAX_NFT_SUPPLY");
    require(getNFTPrice().mul(numberOfNfts) == msg.value, "Ether value sent is not correct");

    for (uint i = 0; i < numberOfNfts; i++) {
        uint mintIndex = totalSupply();
        if (block.timestamp < REVEAL_TIMESTAMP) {
            _mintedBeforeReveal[mintIndex] = true;
        }
        _safeMint(msg.sender, mintIndex);
    }

    
    if (startingIndexBlock == 0 && (totalSupply() == MAX_NFT_SUPPLY || block.timestamp >= REVEAL_TIMESTAMP)) {
        startingIndexBlock = block.number;
    }
}



function _safeMint(address to, uint256 tokenId, bytes memory _data) internal virtual {
    _mint(to, tokenId);
    require(_checkOnERC721Received(address(0), to, tokenId, _data), "ERC721: transfer to non ERC721Receiver implementer");
}   
