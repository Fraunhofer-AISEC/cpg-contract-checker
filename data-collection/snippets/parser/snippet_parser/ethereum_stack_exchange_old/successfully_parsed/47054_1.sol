 uint256 public auctionStartPrice = 0.015 ether;

      struct Auction{
    address owner;
    uint256 price;
    string describtion;
  }

  Auction[] public auctions;

  function createAuction(address _owner, string _describtion) public{
    Auction memory _auction = Auction({
      owner: _owner,
      price: auctionStartPrice,
      describtion: _describtion
    });

    auctions.push(_auction);
  }

  function getVAlueOfAuction(uint256 x) public returns (uint256 value){
      value = auctions[x].price;
      return value;
  }
