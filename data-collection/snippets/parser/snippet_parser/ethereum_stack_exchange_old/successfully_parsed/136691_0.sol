function publicMint(uint256 _numTokens) external payable {
    require(isPublicsaleActive, "Public sale paused");
    require(_numTokens * publicPrice * 1 ether <= msg.value, "Insufficient funds");
    randomMint(_numTokens);
}

function randomMint(uint256 _numTokens) internal {
    uint256 reservedAmount = whitelistReserved[msg.sender];
    require(!(isPresaleActive || isWhitelistsaleActive) || _numTokens <= reservedAmount,                                              "Can't mint more NFTs than reserved" );

    
    require(msg.sender == ContractOwner || _numTokens <= MAX_MINT_PER_TRANSACTION, string(abi.encodePacked("Max mint ", MAX_MINT_PER_TRANSACTION, " per transaction")));
    require(msg.sender == ContractOwner || _numTokens + mintedPerWallet[msg.sender] <= MAX_MINT_PER_WALLET, string(abi.encodePacked(MAX_MINT_PER_WALLET - mintedPerWallet[msg.sender], " mints left for this wallet")));
    

    require(totalSupply + _numTokens <= MAX_TOKENS, "Mint amount exceeds the maximum supply");
    for (uint256 i = 1; i <= _numTokens; ++i) {
        _safeMint(msg.sender, IDs[totalSupply]);
        individualTokenURI[IDs[totalSupply]][0] = initialBaseUri;
        totalSupply += 1;
    }
    mintedPerWallet[msg.sender] += _numTokens;
    if (isPresaleActive || isWhitelistsaleActive && reservedAmount >= _numTokens) {whitelistReserved[msg.sender] = reservedAmount - _numTokens;}
}
