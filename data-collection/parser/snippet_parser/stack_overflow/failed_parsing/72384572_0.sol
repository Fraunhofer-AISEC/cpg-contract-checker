fulfillRandomWords(uint256 requestId, uint256[] memory randomWords)
    internal
    override
{
    tokenCounter = tokenCounter + 1;
    s_randomWords = randomWords;
    s_one_r = randomWords[0];
    address dogOwner = requestIdToSender[s_requestId];
    string memory tokenURI = requestIdToTokenURI[s_requestId];
    uint256 newItemId = tokenCounter;
    checkUri = tokenURI;
    
    _safeMint(dogOwner, newItemId);
    _setTokenURI(newItemId, tokenURI);

    Breed breed = Breed(s_randomWords[0] % 3);
    tokenIdToBreenter code hereed[newItemId] = breed;
    requestIdToTokenId[s_requestId] = newItemId;

    emit FulfillEvent(tokenCounter, s_one_r, tokenURI);
    
}
