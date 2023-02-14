function BuyTickets() public payable {

    require(
        msg.value % ticketPrice == 0,
        string.concat(
            "the value must be multiple of ",
            Strings.toString(ticketPrice),
            " Ether"
        )
    );

    uint256 numOfTicketsToBuy = msg.value / ticketPrice;
