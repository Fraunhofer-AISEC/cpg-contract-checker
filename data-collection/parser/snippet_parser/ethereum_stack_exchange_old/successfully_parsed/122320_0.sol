function mint(uint256 addr, uint256 id) public payable {
    require(id < 10000000000, "id invalid");
    require(saleActive == true, "Public Sale not active!");
    require(msg.value >= mintPrice, "No enough Eth supplied!");
    require(availableSupply > 0, "Not enough supply of tokens"); 

    _safeMint(msg.sender, currentID.current());
    currentID.increment();
    availableSupply = availableSupply - 1;
  }
