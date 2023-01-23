require(_listing[_x][y].status == ListingStatus.Active, "Listing is not active.");

for(uint i = 0; i < _quantity; i++) {
    _tokenId = _listing[_x][y].tokenId;
    IERC721(_listing[_x][y + i].nftContract).transferFrom(address(this), msg.sender, _tokenId);
    _listing[_x][y].status = ListingStatus.Sold;
    _listing[_x][y].nftOwner = payable(msg.sender);

    

    
}
