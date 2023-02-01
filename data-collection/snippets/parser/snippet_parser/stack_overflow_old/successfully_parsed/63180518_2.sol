function makeRefund(uint256 _ticketId ) public returns(Ticket memory) {
        Ticket[] memory ticketByAddress = new Ticket[](tickets[msg.sender].length);
        Ticket memory refundTicket;

        uint numberOfTicket = 0;

        for(uint i = 0; i < tickets[msg.sender].length;  i++) {
            ticketByAddress[numberOfTicket] = tickets[msg.sender][i];
            numberOfTicket++;
        }
        ticketByAddress[_ticketId].refunded = true;
        refundTicket = ticketByAddress[_ticketId];
        
        if(refundTicket.categorie == 1){
            uint256 time = (dateEvent - refundTicket.date)/86400;
            require(time >= 1, "It is too late for a refund!");
            msg.sender.transfer(ticketPrice);
            
            maxTickets++;
            totalTicket++;
        }

        return refundTicket;
    }
