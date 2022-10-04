function executeSale(uint256 tokenId) public payable {
        uint256 price = idToListedToken[tokenId].price;
        require(
            msg.value == price,
            "Insuffient ether sent for the NFT purchase"
        );
        address seller = idToListedToken[tokenId].seller;

        idToListedToken[tokenId].currentlyListed = true;
        idToListedToken[tokenId].seller = payable(msg.sender);
        _itemsSold.increment();

        _transfer(address(this), msg.sender, tokenId);

        approve(address(this), tokenId);

        payable(owner).transfer(listPrice);
        payable(seller).transfer(msg.value);
    }
