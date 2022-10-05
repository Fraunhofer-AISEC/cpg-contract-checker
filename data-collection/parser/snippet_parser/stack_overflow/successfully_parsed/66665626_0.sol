contract auction {
    address highestBidder;
    uint highestBid;

    function bid() payable external {
        require(msg.value >= highestBid);
        prevHighestBidder = highestBidder
        prevHighestBid = highestBid

        highestBidder = msg.sender;
        highestBid = msg.value;
        (bool success, ) = prevHighestBidder.call.value(prevHighestBid)("");
        require(success, "Transfer failed.")
    }
}
