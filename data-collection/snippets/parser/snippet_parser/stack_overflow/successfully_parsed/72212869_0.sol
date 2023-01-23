contract MarketplaceEscrow {
  address public owner;
  constructor() {
    owner = msg.sender;
  }


  modifier onlyOwner {
    require(owner == msg.sender, "Only the owner of the marketplace can perform this action");
    _;
  }

  modifier onlyArbiter {
    require(arbiter == msg.sender, "Only the designated marker can perform this action");
    _;
  }
  function setProductDeliveredAndReleaseFunds(uint _productId) public onlyArbiter {
    Product memory product = products[_productId];
    productPurchaseHistoryForBuyer[buyer][_productId].status = eStatus.product_delivered;
    Seller memory seller = product.seller;
    uint priceether = product.priceEther;
    uint price = priceether*10**18;
    payable(seller.sellerAddress).transfer(price);
  }
}