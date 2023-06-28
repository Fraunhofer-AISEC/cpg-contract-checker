function buySharesYes(string memory _eventName, uint _payment) payable public {
        Event storage currentEvent = events[_eventName];
        require(_payment >= currentEvent.sharePriceYes, "Insufficient payment");
        uint shares = _payment / currentEvent.sharePriceYes;
        require(shares <= currentEvent.totalShares - currentEvent.sharesYes, "No more shares available");
        currentEvent.sharesYes += shares;
        balance += _payment;
        currentEvent.shareholdersYes.push(msg.sender);
        events[_eventName] = currentEvent;
        emit Purchase(msg.sender, _eventName, shares, _payment);
}
