function buy(uint256 _tokenId) public payable {
address buyer = msg.sender;

require(_isApprovedOrOwner(msg.sender, _tokenId), "ERC721: transfer caller is not owner nor approved");
approve(buyer, _tokenId);
safeTransferFrom(ownerOf(_tokenId), buyer, _tokenId); 
}
