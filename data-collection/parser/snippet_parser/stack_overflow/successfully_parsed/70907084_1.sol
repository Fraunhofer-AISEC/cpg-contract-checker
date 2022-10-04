contract ManagerNFT is MintNFT, IERC721 {
   constructor(string memory _name, string memory _symbol) MintNFT(_name, _symbol){}
}
