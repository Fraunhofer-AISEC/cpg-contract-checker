    function buy(uint256 _tokenId) external payable {
        uint256 price = tokenIdToPrice[_tokenId];
        require(price > 0, 'This token is not for sale');
        require(msg.value == price, 'Incorrect value');
        address seller = ownerOf(_tokenId);
        IERC20 tokenContract = IERC20(address(0));
        require(tokenContract.transferFrom(msg.sender, address(this), price), "buy: payment failed");
        payable(seller).transfer(msg.value);
        _transfer(seller, msg.sender, _tokenId);
        tokenIdToPrice[_tokenId] = 0;
        emit NftBought(seller, msg.sender, msg.value);
    }
