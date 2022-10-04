struct Auction{
    address owner;
    uint price;
    string describtion;
  }

  Auction[] public auctions;

  function createAuction(address _owner, uint256 _price, string _describtion) public{
    Auction memory _auction = Auction({
      owner: _owner,
      price: _price,
      describtion: _describtion
    });

    auctions.push(_auction);
  }
