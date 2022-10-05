contract Test {

   struct Bid {
       bytes32 blindedBid;
       uint256 deposit;
   }

   mapping(address => Bid[]) public bids;
 
   function bid(bytes32 _blindedBid)
        public
        payable
    {
        bids[msg.sender].push(Bid({
            blindedBid: _blindedBid,
            deposit: msg.value
        }));
    }
}
