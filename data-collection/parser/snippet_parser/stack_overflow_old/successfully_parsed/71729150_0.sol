function mint(uint256 quantity_) public payable {
        require(isPublicMintEnabled, 'minting not enabled');
        require(msg.value == quantity_ * mintPrice, 'wrong mint value');
        require(totalSupply + quantity_ <= maxSupply, 'sold out');
        require(walletMints[msg.sender] + quantity_ <= maxPerWallet, 'exceed max wallet');

        
        for (uint256 i = 0; i < quantity_; i++) {
        uint256 newTokenId = totalSupply + 1;
        totalSupply++;
        _safeMint(msg.sender, newTokenId);
        }
    }
