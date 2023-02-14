function BuyTickets() public payable {

        IERC20 token = IERC20(address(0x123)); 
        
        require(
            token.transferFrom(
            msg.sender, 
            address (players),
            msg.value % ticketPrice == 0,
            string.concat(
                "the value must be multiple of ",
                Strings.toString(ticketPrice),
                " Ether"
            );
        );

        uint256 numOfTicketsToBuy = msg.value / ticketPrice;
        players.push(payable(msg.sender));

        require(
            numOfTicketsToBuy <= RemainingTickets(),
            "Not enough tickets available."
        );

        for (uint256 i = 0; i < numOfTicketsToBuy; i++) {
            tickets.push(msg.sender);
        }
    }
