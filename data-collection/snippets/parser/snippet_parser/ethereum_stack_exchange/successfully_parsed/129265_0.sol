   uint public ticketPrice = 100 * 10 ** 18;
   uint ticketId;
   address public dao; 
   mapping(uint => address) public ticketToAddress;
   mapping(address => uint[]) public addressToTickets;

   uint[] public tickets;


function buyTicket(uint256 prixUnitaire, uint256 quantity) external returns (uint) {      
    require((prixUnitaire * quantity) == (ticketPrice * quantity), "Not the good price"); 

    transfer(dao, (10 * 10 ** 18 * quantity));
    transfer(address(this), (90 * 10 ** 18 * quantity));

    for(uint i = quantity; i >= 1; i--) {
        addressToTickets[msg.sender] = tickets.push(ticketId);
        ticketToAddress[ticketId] = msg.sender; 
    ticketId++;
    }

    return ticketId;
}
