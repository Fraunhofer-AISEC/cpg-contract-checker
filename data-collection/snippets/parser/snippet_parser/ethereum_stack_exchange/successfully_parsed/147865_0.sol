address payable winner;
event endContract(address indexed winner);
uint256 private ticketCount;

function endContract() private {
        require(ticketCount == MAX_TICKETS, "All tickets must be sold to select a winner");
        
        uint256 winnerTicketId = random() % MAX_TICKETS + 1;
        winner = ticketOwners[winnerTicketId];  
        
        
        uint256 transferAmount = (totalPot*80)/100;
        winner.transfer(transferAmount);
        emit endContract(winner);
        
    }   
