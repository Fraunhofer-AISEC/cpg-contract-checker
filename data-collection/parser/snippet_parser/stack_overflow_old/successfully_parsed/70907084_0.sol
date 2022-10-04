contract MintNFT is ERC721Enumerable, Ownable {
    constructor(string _name, string _symbol) ERC721(_name, _symbol){}
}
