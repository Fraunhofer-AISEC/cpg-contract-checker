contract ERC721NFTMinter is Ownable, ERC721URIStorage{
 
  address marketPlaceAddress;

  using Counters for Counters.Counter;
  Counters.Counter private _tokenIds;

  
   constructor(address _marketplaceAddress) ERC721("Metaverse NFTs", "META-NFT"){
    
    
      _tokenIds.increment();
      marketPlaceAddress = _marketplaceAddress;
    

   }

   
   
   
  function mintNFT(string memory _tokenURI) public returns(uint256){
    require(msg.sender != address(0), "ERC721NFTMinter#mintNFT: ZERO_ADDRESS");
    
    
    uint256 newItemId = _tokenIds.current();
     _tokenIds.increment();
    
    _safeMint(address(msg.sender), newItemId);
    
    _setTokenURI(newItemId, _tokenURI);
    
    setApprovalForAll( marketPlaceAddress, true);

    return newItemId;
  }

}

