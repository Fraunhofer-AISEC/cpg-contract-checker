function changePrice(uint memory price) external ownerAddressOnly() {
    this.price = price;
  }
