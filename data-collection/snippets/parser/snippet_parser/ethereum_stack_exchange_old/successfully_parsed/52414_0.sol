

function sellDeal(string _name, string _description, uint256 _price, string[] _images, string[] _sellerDocuments, string[] _buyerDocuments, uint _category, uint256 _dateposted) public {
    dealCounter++;
    
    deals[dealCounter] = Deal(
      dealCounter,
      _name,
      _description,
      _price,
      msg.sender,
      0x0,
      _sellerDocuments,
      _buyerDocuments,
      _images,
      0,
      _category,
      _dateposted
      );

    emit LogSellDeal(dealCounter, msg.sender, _name, _price);
}
