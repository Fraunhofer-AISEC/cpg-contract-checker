function BuyTickets(uint256 BuyTicketsNow) public returns(bool) {

    require(
        msg.value % ticketPrice == 0,
        string.concat(
            "the value must be multiple of ",
            Strings.toString(ticketPrice),
            " Ether"
        )
    );

    uint256 numOfTicketsToBuy =  msg.value / ticketPrice;

    BuyTicketsNow = numOfTicketsToBuy;

    require(BuyTicketsNow >= GetAllowance(), "Please approve tokens before transferring");

    require(BuyTicketsNow <= RemainingTickets(),"Not enough tickets available.");

    token.transferFrom(msg.sender, address(this), BuyTicketsNow);

    for (uint256 i = 0; i < numOfTicketsToBuy; i++) {
        tickets.push(msg.sender);
    }
    return true;
 }
