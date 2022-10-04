function list(uint256 tokenId, uint256 price) public {
   require(msg.sender == collectibleContract.ownerOf(tokenId));
   require(price >= comissionFee);
   collectiblePrice[tokenId] = price;
   emit nftlisted(tokenId, price);

}

function unlist(uint256 tokenId) public {
   require(msg.sender == collectibleContract.ownerOf(tokenId));
   collectiblePrice[tokenId] = 0;
   emit nftunlisted(tokenId);
}