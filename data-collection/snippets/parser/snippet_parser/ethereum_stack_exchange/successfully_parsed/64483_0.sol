
function registerItem(string memory _identifier, string memory _code, string memory _description) public {
    
    require(!itemExists[keccak256(abi.encodePacked(_identifier,_code))]);
    
    Item memory newItem;
    newItem.identifier = _identifier;
    newItem.code = _code;
    newItem.description = _description;
    
    itemExists[keccak256(abi.encodePacked(_identifier,_code))] = true;
    
    tokenCounter ++;
    
    uint256 tokenId = tokenCounter;
    
    tokenIdtoItem[tokenId] = newItem;
    
    ERC721Token.mint(tokenId);
    
    emit ItemRegistered(tokenId, _identifier, _code);
}


function getItemByToken(uint256 _tokenId) public view returns (string memory identifier, string memory code, string memory description) {
    Item memory returnItem = tokenIdtoItem[_tokenId];
    return(returnItem.identifier,returnItem.code,returnItem.description);
}
