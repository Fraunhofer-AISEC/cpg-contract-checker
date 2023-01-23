for (uint256 i = 0; i < numberOfTokens; i++) {
    uint256 mintIndex = totalSupply(); 
    if (totalSupply() < MAX_TEST_NFT) {  
        _safeMint(msg.sender, mintIndex);
    }
}