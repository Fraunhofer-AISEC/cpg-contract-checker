
function mintMemories(string memory _tokenURI) public onlyOwner {
    require(
        memoryCounter < maxMemories,
        "Already minted maximum possible memories."
    );
    for (uint8 i = 0; i < memoryBatchLimit; i++) {
        _safeMint(address(this), memoryCounter);
        _setTokenURI(memoryCounter, _tokenURI);
        
        memoryCounter++;
    }
}
