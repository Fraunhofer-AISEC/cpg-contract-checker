function approveNFT(address approveFor, uint256 tokenID) external onlyOwner{
   nftContract.approve(approveFor, tokenID) 
}
