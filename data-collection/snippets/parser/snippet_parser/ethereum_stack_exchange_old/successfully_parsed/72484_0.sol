address public winneraddress;

function getHighestBidID() public onlyOwner view returns (uint highestID, address _highestidaddress) {
    require(bids.length > 0,"Bid length");
    uint highestAmount = 0;
    for (uint i=0; i<bids.length; i++) {
        if (bids[i].amount > highestAmount) {
            highestAmount = bids[i].amount;
            highestID = i;
            _highestidaddress = bids[highestID].bidderAddress;
        }
    }
    winneraddress = _highestidaddress;
}
        mapping(address => uint256) public payments; 

    function makeBid(string memory _extraData) public inState(State.Active) payable returns(uint bidIterator) {
    require(msg.value > 0, "No value inserted");
    require(bidders <= 3, "Contract reached max registrations");
    require(payments[msg.sender] == 0, 'Sender previously paid into escrow.');
    bids.push(Bid(msg.sender, msg.value, _extraData, true));
    payments[msg.sender] = msg.value;
    bidders ++; 
    return bids.length - 1;
} 
    
