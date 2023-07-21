function safeMintNft() public payable whenNotPaused {
    require(
        nftCost > 0, "NFT cost is not set"
    );

    require(
        keccak256(bytes(whitelistedAddresses[msg.sender].discordUser)) !=
            keccak256(""),
        "Address is not whitelisted"
    );

    require(
        keccak256(bytes(whitelistedAddresses[msg.sender].user_type)) == keccak256(bytes("buyer")),
        "Only buyers can mint the NFT"
    );
    uint256 minterBalance = address(msg.sender).balance;
    require(
        minterBalance >= nftCost,
        "not enough tokens to pay for this NFT"
    );

    
    uint256 tokenId = _tokenIdCounter.current();
    _tokenIdCounter.increment();
    tokenIdAddresses[tokenId] = msg.sender;

    address payable contractAddress = payable(address(this));
    contractAddress.transfer(nftCost);

    _safeMint(msg.sender, tokenId);
}
