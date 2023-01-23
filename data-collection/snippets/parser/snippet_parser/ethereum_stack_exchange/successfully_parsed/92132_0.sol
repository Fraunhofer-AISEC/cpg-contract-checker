  function changePrice(uint256 price) public payable returns (bool success) {
      require(msg.sender == admin, "Only the admin is authorised to change the price of Token.");
      
      if (address(this).balance < price.mul(tokensSold)) {
        uint256 fundsNeeded = (price.mul(tokensSold)).sub(address(this).balance);
        require(msg.sender.balance >= fundsNeeded, "Can't change price: your balance seems insufficient to send funds to the contract.");
        address(this).transfer(fundsNeeded);
      }
      
      require(address(this).balance >= price.mul(tokensSold), "Contract has insufficient funds for the price to be changed.");
      
      tokenPrice = price;
      
      emit Price(price);
      
      return true;
  }
