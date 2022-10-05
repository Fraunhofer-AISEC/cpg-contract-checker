 function bid(bytes32 blindBid) public payable validPhase(Phase.Bidding)
    {
        bids[msg.sender] = Bid({
            blindedBid: blindBid,
            deposit: msg.value
        });
    }
