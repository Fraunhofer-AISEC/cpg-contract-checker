contract MyMarketplace is MyERC721 {

   using MarketLib for MarketLib.PunkCell;

   
   CryptoPunksMarket punksContract = CryptoPunksMarket(0xb47e3cd837dDF8e4c57F05d70Ab865de6e193BBB);

   address public punk9999OwnerAddress;


   constructor() MyERC721() public { 

      
      punk9999OwnerAddress = punksContract.punkIndexToAddress(9999);

      
   }
}
