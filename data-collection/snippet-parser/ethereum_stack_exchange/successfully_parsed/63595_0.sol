pragma solidity ^0.4.25;

contract bidding {
  address[] private bidderAccts;

  struct bidStruct {
    uint  bid;
  }
  mapping (address => bidStruct) biddersMap;

  event totalAccounts(address, uint );

  function setBidders(address _address , uint _bid)  public {
    bidStruct a = biddersMap[_address];
    a.bid = _bid;
    bidderAccts.push(_address) - 1 ;
  }

  function getBidders(address _address) view public returns(uint) {
    return biddersMap[_address].bid;
  }

  function countBidders() view public returns (uint) {
    return bidderAccts.length;
  }

  function allBidders() public  {
    for (uint i = 0; i < bidderAccts.length; i++) {
      emit totalAccounts(bidderAccts[i],biddersMap[bidderAccts[i]].bid);
    }
  }
}
