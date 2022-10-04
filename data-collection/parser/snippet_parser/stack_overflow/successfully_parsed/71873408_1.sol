function buyTicketFromAttendee(uint256 _ticketId) 
    external
    payable
    {
        require(eventticket[_ticketId - 1].availableForResell = true,"ticket not for sale");
        uint256 _priceToPay = eventticket[_ticketId - 1].ticketPrice;
        
        require((msg.value >= _priceToPay + transferFee),"not enough money");

        address seller = eventticket[_ticketId - 1].seller;
        address owner = eventticket[_ticketId - 1].owner;
        
        payable(owner).transfer(transferFee);
        payable(seller).transfer(msg.value - transferFee);
        _transfer(address(this), msg.sender, _ticketId);
        
        
        eventticket[_ticketId - 1].availableForResell = false;
         
    }
