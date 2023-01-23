  uint128 public publicSalePrice = 0.01 ether;

 

  function updatePrice() internal returns (uint256) {
  return publicSalePrice = totalSupply() < 2000 ? 0.01 ether : 0.03 ether;
  }
         
 

 function publicSaleMint(uint256 _quantity) external payable callerIsUser {
    require(sellingStep == Step.PublicSale, "Public sale is not  activated");
    require(totalSupply() + _quantity <= MAX_PUBLIC, "Max supply exceeded");
    require(totalSupply() + _quantity <= MAX_SUPPLY, "Max supply exceeded");
    require(msg.value >= updatePrice() * _quantity, "Not enought funds");
    _safeMint(msg.sender, _quantity);
}
