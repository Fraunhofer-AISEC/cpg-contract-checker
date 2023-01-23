contract Exchange is ERC721Enumerable {
    function sellToExchange(uint256 _tokenId, uint256 _sellPrice) public {
       safeTransferFrom(msg.sender, payable(this), _tokenId);
    }
}
