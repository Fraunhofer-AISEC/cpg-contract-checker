 struct ticket {
        uint16 looteryID;
        uint ticketPrice;
        uint ticketSerialNo;
    }

mapping(address => ticket[]) public activeTickets;

function buyLottery(uint16 _id) payable public {
    activeTickets[msg.sender].push(ticket(_id,10,100));
}

function getLooteryID(uint256 index, address userAddress) external view returns(uint16) { 
   return activeTickets[userAddress][index].looteryID;
}

function getLength(address userAddress) external view returns(uint256) {
    return return activeTickets[userAddress].length;
}

