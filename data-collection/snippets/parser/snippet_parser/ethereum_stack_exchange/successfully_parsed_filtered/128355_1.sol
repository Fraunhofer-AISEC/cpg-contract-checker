function mintToken(string memory tokenURI,uint price) public payable returns (uint){
    require("write logic this tokenUri was not used before");
    require("make sure sender is sending the lsiting price");
    _tokenIds.increment();
    _listedItems.increment();
    uint newTokenId=_tokenIds.current();
    
    _safeMint(msg.sender,newTokenId);
     
     
    _createNftItem(newTokenId,price);
    
    return newTokenId;
  }
