function newBid(bytes32 sealedBid) payable {
  if (address(sealedBids[msg.sender][sealedBid]) > 0) throw;
  if (msg.value < minPrice) throw;

  
  Deed newBid = (new Deed).value(msg.value)(msg.sender);
  sealedBids[msg.sender][sealedBid] = newBid;
  NewBid(sealedBid, msg.sender, msg.value);
} 
