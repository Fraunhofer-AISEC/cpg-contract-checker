struct Ticket {
        uint256 id;
        uint256[] numbers;
        address payable owner;
}


function enter(uint256[] memory userNumbers) public {
        Ticket memory newTicket = Ticket(
            id,
            userNumbers,
            payable(msg.sender)
        );

        entries[id][msg.sender] = newTicket;
    }
