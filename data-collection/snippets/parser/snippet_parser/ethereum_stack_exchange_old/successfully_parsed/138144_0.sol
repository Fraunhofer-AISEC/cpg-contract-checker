contract ExampleNFT is ERC721URIStorage, Ownable{
   using Counters for Counters.Counter;
   Counters.Counter private _tokenIds;

   constructor() ERC721("NFT", "ENFT") {}

   struct Test {
       address creator;
       uint256 id;
   }

   event Mint(address indexed recipient, uint256 tokenId, Test test);

   function mintNFT(address recipient, string memory tokenURI, Test memory test)
       public onlyOwner
       returns (uint256)
   {
       _tokenIds.increment();

       uint256 newItemId = _tokenIds.current();
       _mint(recipient, newItemId);
       _setTokenURI(newItemId, tokenURI);

       emit Mint(recipient, newItemId, test);

       return newItemId;
   }
}
