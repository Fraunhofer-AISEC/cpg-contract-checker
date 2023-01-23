function done() onlyOwner public{
    require (state == State.Active, "Contract still working.");
    state = State.WinnerSelected;
}

function withdraw() external onlyOwner payable{
    require (state == State.WinnerSelected, "Contract not closed to withdraw.");
    owner.transfer((address(this).balance));
}

function release() public {
    require(payments[msg.sender] > 0, 'Sender has not paid into escrow.');
    require(released[msg.sender] == 0, 'Sender has already released funds.');
    released[msg.sender] = payments[msg.sender];
    
}

function makeBid(string memory _extraData) public inState(State.Active) payable returns(uint bidIterator) {
    require(msg.value > 0, "No value inserted");
    require(bidders <= 3, "Contract reached max registrations");
    require(payments[msg.sender] == 0, 'Sender previously paid into escrow.');
    bids.push(Bid(msg.sender, msg.value, _extraData, true));
    payments[msg.sender] = msg.value;
    bidders ++; 
    
    
    
    return bids.length - 1;
}
