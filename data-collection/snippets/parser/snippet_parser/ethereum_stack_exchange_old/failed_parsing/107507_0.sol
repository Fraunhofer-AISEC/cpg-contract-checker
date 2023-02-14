  1 contract NFT is ERC1155, Ownable {
  2    constructor(string memory tokenURI) ERC1155 (tokenURI) {}
  3     function createNFT(address receiver, uint amount)
  4         public onlyOwner
  5     {
  6          _mint(receiver, 0, 10**10, "");
  7      }
  8 }
