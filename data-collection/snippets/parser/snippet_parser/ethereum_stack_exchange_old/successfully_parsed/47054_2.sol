 uint256 public myEtherValue = 1 ether;

 Auction[] public auctions;

  function createAuction(address _owner, uint256 _price, string _describtion) public{

    uint256 newPrice = SafeMath.mul(_price, myEtherValue);

    Auction memory _auction = Auction({
      owner: _owner,
      price: newPrice,
      describtion: _describtion
    });

    auctions.push(_auction);
  }

  function getVAlueOfAuction(uint256 x) public returns (uint256 value){
      value = auctions[x].price;
      return value;
  }
