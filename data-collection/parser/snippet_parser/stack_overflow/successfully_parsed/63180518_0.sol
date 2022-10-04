function setTicket(address _address, string memory _firstname, string memory _lastname) public returns(uint256){
        
        uint256 ticketNewId = uint256(keccak256(abi.encodePacked(block.timestamp, block.difficulty)));
        Ticket storage ticket = tickets[_address];
        ticket.firstname = _firstname;
        ticket.lastname = _lastname;
        ticket.ticketId = ticketNewId;
        ticketaccts.push(_address);
        return ticketNewId;
    }
    
    function getTickets() view public returns(address[] memory){
        return ticketaccts;
    }
    
    function getTicket(address _address) view public returns (Ticket memory){
        return (tickets[_address]);
    }
