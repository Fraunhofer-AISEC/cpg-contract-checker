function() public payable {
    require(now < ticketExpiryDateTimestamp, "This sale has been completed");
    require(emitedTickets < maxTicketsSupply, "Sold out");
    uint _ticketsAmount = msg.value / ticketPrice;
    require(_ticketsAmount < maxTicketsSupply, "You can't buy more tickets than the emitted number");
    require(_ticketsAmount > 0, "You did not pay enough to buy any ticket");
    transfer(msg.sender, msg.value - _ticketsAmount * ticketPrice);
    mint(msg.sender, _ticketsAmount);
    emitedTickets += _ticketsAmount;
}
