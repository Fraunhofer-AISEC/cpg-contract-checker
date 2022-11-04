function mintTestNFT(uint256 numberOfTokens) public payable {
    require(saleIsActive, "Sale must be active to mint NFT");
    require(
        numberOfTokens > 0 && numberOfTokens <= maxNftPurchase, 
        "Can only mint 20 tokens at a time"
    );

    uint supply = totalSupply(); 

    require(
        supply.add(numberOfTokens) <= MAX_TEST_NFT, 
        "Purchase would exceed max supply of TEST NFTs"
    );
    require(
        msg.value >= salePrice.mul(numberOfTokens),
        "Ether value sent is not correct"
    );

    for (uint256 i = 0; i < numberOfTokens; i++) {
        if (supply < MAX_TEST_NFT) { 
            _safeMint(msg.sender, mintIndex);
        }
        supply++;  
    }
}
