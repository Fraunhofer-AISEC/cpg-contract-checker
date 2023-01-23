function sellNFT(uint256 _tokenId, uint256 _sellPrice) public {
   require(
      _sellPrice > 2e12,
      "Sale Error: Sell price must be greater than 2e12 (2 szabos)."
   );
   safeTransferFrom(msg.sender, address(this), _tokenId);

   
   emit TokenTransferredToExchange(msg.sender, _tokenId, _sellPrice); 

   _tokenInfo[_tokenId] = TokenSeller(
      _tokenId,
      msg.sender,
      _sellPrice,
      getTokenValue(_tokenId)
   );
}
