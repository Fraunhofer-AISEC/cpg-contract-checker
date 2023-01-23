    function buyNft(uint tokenId) public payable {
        uint price = _idToNftItem[tokenId].price;
        address owner = ERC721.ownerOf(tokenId);
        
        require(msg.sender != owner, 'You already own this NFT');
        require(msg.value == price, "Please submit the asking price");

        _idToNftItem[tokenId].isListed = false;
        _listedItems.decrement();

        _transfer(owner, msg.sender, tokenId);
        payable(owner).transfer(msg.value);
    }
