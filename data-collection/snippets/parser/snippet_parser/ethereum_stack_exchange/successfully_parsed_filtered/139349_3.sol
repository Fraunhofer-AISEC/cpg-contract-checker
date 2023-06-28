    function mintWithERCToken(uint256 mintAmount, uint256 tokenID) public payable {
    CryptoTokenInfo storage tokens = permittedCrypto[tokenID];
    IERC20 paytoken;
    paytoken = tokens.paytoken;
    uint256 costval;
    costval = tokens.costvalue;
    uint256 totalCost = costval * mintAmount;
    uint256 supply = totalSupply();
    uint256 senderBal = paytoken.balanceOf(msg.sender);

    require(mintAmount > 0, "You need to mint at least 1 NFT");
    require(
        mintAmount <= maxMintAmount,
        "Max mint amount per session exceeded"
    );
    require(supply + mintAmount <= maxSupply, "Max NFT exceeded");

    if (msg.sender != owner()) {
        
        if (onlyWhitelisted == true) {
            require(
                isWhitelisted(msg.sender),
                "Sorry, address is not whitelisted"
            );
        }
        
        
    }
    require(senderBal >= totalCost, "You do not have enough tokens to pay");
    
    payToken.transferFrom(msg.sender, address(this), totalCost);
    
    for (uint256 i = 1; i <= mintAmount; i++) {
        _safeMint(msg.sender, supply + i);
    }
}
