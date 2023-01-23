  function createItem(
    address nftContract,
    uint256 tokenId
    ) public payable{
     address _owner = IERC721(nftContract).ownerOf(tokenId);
     IERC721(nftContract).transferFrom(_owner, address(this),tokenId);
      IERC721(nftContract).approve(address(this),tokenId);    
  }
