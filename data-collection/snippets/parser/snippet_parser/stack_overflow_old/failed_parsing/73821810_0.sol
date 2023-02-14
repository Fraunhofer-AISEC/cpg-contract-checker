    
    _safeMint(msg.sender, currentTokenId);

    
    _setTokenURI(currentTokenId, tokenURI);

    
    _create(currentTokenId, tokenURI, name, listPrice);

    setApprovalForAll(address(this), true);

    
    _tokenIds.increment();
    uint256 newTokenId = _tokenIds.current(); 
    return newTokenId;
}

function _create(uint256 tokenId, string memory tokenURI, string memory name,  uint256 price) private {
    
    require(msg.value == listPrice, "Hopefully sending the correct price");
    
    
    require(price > 0, "Make sure the price isn't negative");

    
    idToToken[tokenId] = Token(
        tokenId,
        tokenURI,
        name,
        payable(address(this)),
        price,
        true
    );

    _transfer(msg.sender, address(this), tokenId);
    
    emit TokenListedSuccess(
        tokenId,
        address(this),
        price,
        true
    );
}
function buyNFT(uint256 tokenId) public payable {
        require(msg.value > 0, "You need to send some ether");
        require(msg.value == idToToken[tokenId].price, "Please submit the asking price in order to complete the purchase");

        approve(msg.sender, tokenId);
        setApprovalForAll(msg.sender, true);

        transferFrom(address(this), msg.sender,tokenId);
       
        payable(idToToken[tokenId].owner).transfer(msg.value);

        
        idToToken[tokenId].owner = payable(msg.sender);
        idToToken[tokenId].isForSale = false;
        _itemsSold.increment();
   
        
        payable(address(this)).transfer(msg.value);

        
    }
