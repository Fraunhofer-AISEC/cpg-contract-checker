 struct Token {
        uint id;
        uint price;
        uint prevPrice;
        bool forSale;
    }


function buyMarketplaceToken(uint _tokenId) public payable whenNotPaused() isForSale(_tokenId) {
        address ticketOwner = ownerOf(_tokenId);
        require(msg.value >= tokens[_tokenId].price, "It costs more!");
        ticketOwner.transfer(msg.value);
        safeTransferFrom(ticketOwner, msg.sender, _ticketId);
        clearApproval(this, _ticketId);
        tokens[_tokenId].forSale = false;
    }

    function addTokenForSale(uint _tokenId, uint newPrice) public onlyOwner(_tokenId) whenNotPaused() {
        tokens[_tokenId].forSale = true;
        tokens[_tokenId].prevPrice = tokens[_tokenId].price;
        tokens[_tokenId].price = newPrice;
        approve(address(this), _tokenId);
        emit TokenOnSale(_tokenId, newPrice);
    }

        function removeTokenForSale(uint _tokenId) public onlyOwner(_tokenId) whenNotPaused() {
        tokens[_tokenId].forSale = false;
        tokens[_tokenId].price = tokens[_tokenId].prevPrice;
        clearApproval(address(this), _tokenId);
        emit TokenOffSale(_tokenId, tokens[_tokenId].prevPrice);
    }
