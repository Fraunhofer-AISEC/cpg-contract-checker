function getTicketByAddress(address _address) public view returns (Ticket[] memory){ 
        Ticket[] memory ticketByAddress = new Ticket[](tickets[_address].length);

        uint numberOfTicket = 0;

        for(uint i = 0; i < tickets[_address].length;  i++) {
            ticketByAddress[numberOfTicket] = tickets[_address][i];
            numberOfTicket++;
        }

        return ticketByAddress; 
    }
