function findTickets(int val) public view returns(Ticket[] memory) {
    uint256 resultCount;

    for (uint i = 0; i < tickets.length; i++) {
        if (tickets[i].val == val) {
            resultCount++;  
        }
    }

    Ticket[] memory result = new Ticket[](resultCount);  
    uint256 j;

    for (uint i = 0; i < tickets.length; i++) {
        if (tickets[i].val == val) {
            result[j] = tickets[i];  
            j++;
        }
    }

    return result; 
}
