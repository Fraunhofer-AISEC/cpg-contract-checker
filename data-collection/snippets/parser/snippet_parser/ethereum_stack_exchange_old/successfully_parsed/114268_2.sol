function mint(
   
string memory _tokenURI,
uint256 _Amount,
uint256 _Value,
uint256 _duration

) public returns (uint256) {
   
   
   
    _tokenIds.increment();
    
    uint256 _tokenId = _tokenIds.current();
   
   _mint(msg.sender, _tokenId);               

   _setTokenURI(_tokenId, _tokenURI);         
   
  
   uint256 duration = block.timestamp + (_duration * 1 days);
   
   
   Metadata(msg.sender,_tokenURI,_tokenId,_Value,_Amount,duration);
   
    
   return _tokenId;                         

}
