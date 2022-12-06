function setListingPrice(uint newPrice) external onlyOwner{
    require(newPrice>0,"Price must be at least 1 wei");
    listingPrice=newPrice;
  }
