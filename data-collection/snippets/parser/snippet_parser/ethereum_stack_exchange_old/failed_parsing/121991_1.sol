function lookUptokenIdToStarInfo (uint _tokenId) public view returns 
        (string memory name, string memory symbol) {
        
        be pure to previous standard way of doing things we are 
        returning it as a string
        name = tokenIdToStarInfo[_tokenId].name;
        symbol = tokenIdToStarInfo[_tokenId].symbol;
        return (name,symbol);
    }
