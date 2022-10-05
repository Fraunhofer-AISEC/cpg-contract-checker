function mint() external payable {
        require(isMintEnabled, 'minting not enabled');
        require(mintedWallets[msg.sender] < 1, 'exceeds max per wallet' ) ;
        require(msg.value == mintPrice, 'wrong value');
        require(maxSupply > totalSupply, 'sold out');

        mintedWallets[msg.sender]++;
        totalSupply++;
        uint256 totalId = totalSupply;
        
        
        uint tokenId = 0;
        _safeMint(msg.sender, tokenId);
    }
