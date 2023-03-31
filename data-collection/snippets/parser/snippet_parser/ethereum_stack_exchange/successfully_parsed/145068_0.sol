struct Bid {
        bool hasBid;
        uint tokenId1;
        address bidder;
        uint value;
    }

    
    mapping (uint => Bid) public Bids; 

function enterBidForNFT(uint Index, value) public virtual  {
        Bids[Index] = Bid(true, Index, msg.sender, value);
    }
