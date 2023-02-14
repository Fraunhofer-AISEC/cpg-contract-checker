    function mint(uint256 _mintAmount) public payable whenMintNotPaused() {
        require(_tokenIdTracker.current() + _mintAmount <= maxAvailableTokens, "all tokens have been minted");
        require(!Address.isContract(msg.sender), "address cannot be a contract");
        require( _mintAmount <= 10, "You can mint a maximum of 10");
        require( msg.value == _salePrice * _mintAmount, "Ether sent is not equal to PRICE * num" );
        payable(treasurer).transfer(msg.value);
        transferNFTs(_mintAmount, msg.sender);
    }

    function transferNFTs(uint256 num, address recipient) private {
        for(uint256 i = 0; i < num; i++){
            uint256 newItemId = initialId + _tokenIdTracker.current(); 
            super._safeMint(recipient, newItemId);
            require(_exists(newItemId), "minting the ID failed");
            setRoyalties(newItemId);
            string memory completeURI;
            completeURI = string(abi.encodePacked(Strings.toString(newItemId), suffix));
            _setTokenURI(newItemId, completeURI); 
            _tokenIdTracker.increment();
            emit NftBought(msg.sender, newItemId);
        }
    }
