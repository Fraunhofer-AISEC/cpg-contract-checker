contract BidHistory {
  struct Bid {
    address bidOwner;
    uint bidAmount;
    bytes32 nameEntity;
  }
  mapping (uint => Bid) public bids;
  uint public bidCount;

  constructor() public {
    bidCount = 0;
    storeBid("address0",0,0);
    storeBid("address1",1,1);
  }
  function storeBid(address memory _bidOwner, uint memory _bidAmount, bytes32 memory _nameEntity) public  {
    bids[tripcount] = Bid(_bidOwner, _bidAmount,_nameEntity);
    bidCount++;
  }
  
  function getBid() public view returns (Bid[] memory){
      Bid[] memory lBids = new Bid[](tripcount);
      for (uint i = 0; i < bidCount; i++) {
          Bid storage lBid = bids[i];
          lBids[i] = lBid;
      }
      return lBids;
  }
}
