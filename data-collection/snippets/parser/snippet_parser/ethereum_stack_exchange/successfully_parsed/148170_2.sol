mapping(uint256 => bool) public mintedTokens;
uint256 public nextPublicTokenId = 1;

function publicMint() public {
    require(nextPublicTokenId <= MAX_NFT_SUPPLY, "All tokens have been minted");

    while (mintedTokens[nextPublicTokenId]) {
        nextPublicTokenId++;
        require(nextPublicTokenId <= MAX_NFT_SUPPLY, "All tokens have been minted");
    }

    _safeMint(msg.sender, nextPublicTokenId);
    mintedTokens[nextPublicTokenId] = true;
    nextPublicTokenId++;
}
