 struct ticket {
        uint16 looteryID;
        uint ticketPrice;
        uint ticketSerialNo;
    }

mapping(address => ticket[]) public activeTickets;

function buyLottery(uint16 _id) payable public {
    activeTickets[msg.sender].push(ticket(_id,10,100));
}
