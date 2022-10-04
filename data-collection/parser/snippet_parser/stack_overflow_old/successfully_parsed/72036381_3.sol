contract ezeynftFactory is ERC721 {
    constructor(string memory name, string memory symbol,string memory tokenURI,uint tokenID) 
     ERC721(name,symbol)
    {
        _mint(msg.sender, tokenID); 
        _setTokenURI(tokenID,tokenURI);
    }
}
