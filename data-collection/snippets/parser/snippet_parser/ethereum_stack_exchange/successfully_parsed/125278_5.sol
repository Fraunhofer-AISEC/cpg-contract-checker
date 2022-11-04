
function buy(uint256 tokenId) public {
   require(collectiblePrice[tokenId] != 0); 
   require(collectiblePrice[tokenId] >= comissionFee);
   nusContract.transferFrom(msg.sender, _owner, comissionFee);
   nusContract.transferFrom(msg.sender, getOwner(tokenId), (collectiblePrice[tokenId] - comissionFee));
   collectibleContract.transferFrom(getOwner(tokenId), msg.sender, tokenId);

   emit bought(tokenId);
}

function getContractOwner() public view returns(address) {
   return _owner;
}
