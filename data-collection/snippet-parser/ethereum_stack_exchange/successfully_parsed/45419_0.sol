function purchase(uint256 _tokenId) public payable {
    address oldOwner = tokenOwner[_tokenId];
    uint256 sellingPrice = emojiIndexToPrice[_tokenId];
    address newOwner = msg.sender;

    require(oldOwner != newOwner);

    require(newOwner != address(0));

    require(msg.value >= sellingPrice);

    uint256 percentage = SafeMath.sub(100, ownerCut);
    uint256 payment = uint256(SafeMath.div(SafeMath.mul(sellingPrice, percentage), 100));
    uint256 purchaseExcess = SafeMath.sub(msg.value, sellingPrice);

    emojiIndexToPrice[_tokenId] = SafeMath.div(SafeMath.mul(sellingPrice, 150), percentage);

    _transfer(oldOwner, newOwner, _tokenId);

    if (oldOwner != address(this)) {
      oldOwner.transfer(payment);
    }

    msg.sender.transfer(purchaseExcess);
}
