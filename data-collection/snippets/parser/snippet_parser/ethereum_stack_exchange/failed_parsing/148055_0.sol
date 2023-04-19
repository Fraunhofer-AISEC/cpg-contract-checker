    
    require(eventBalance[eventId] > 0, "Event balance is zero or negative");

    
    events[eventId].eventstatus = Status.CANCELED;
    emit eventCancelled(eventId);

    
    for (uint256 i = 0; i < eventToTicketIds[eventId].length; i++) {
        uint256 ticketId = eventToTicketIds[eventId][i];
        uint ticketQty = tickets[ticketId].ticketQty;
        address payable ticketHolder = payable(ticketHolders[ticketId]);
        uint refundAmount = ticketQty * events[eventId].ticketPrice;

        
        if (eventBalance[eventId] >= refundAmount) {
            eventBalance[eventId] -= refundAmount;
            payOut(ticketHolder, refundAmount);

            
            uint256[] storage holderTicketIds = buyerToTicketIds[ticketHolder];
            for (uint256 j = 0; j < holderTicketIds.length; j++) {
                if (holderTicketIds[j] == ticketId) {
                    for (uint256 k = j; k < holderTicketIds.length - 1; k++) {
                        holderTicketIds[k] = holderTicketIds[k+1];
                    }
                    holderTicketIds.pop();
                    break;
                }
            }

            tickets[ticketId].ticketstatus = TicketStatus.Refunded;
            emit ticketRefunded(ticketHolder, eventId, ticketId, refundAmount);
        }
    }
    delete eventToTicketIds[eventId];
    delete events[eventId];
    eventExists[eventId] = false;

    return true;
}
