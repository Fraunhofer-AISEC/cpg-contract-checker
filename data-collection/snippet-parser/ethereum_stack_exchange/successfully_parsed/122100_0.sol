pragma solidity >=0.4.22 <0.9.0;

uint256 constant TOTAL_TICKETS = 10;

contract Tickets {
    address public owner = msg.sender;

    struct Ticket {
        uint256 id;
        uint256 price;
        address owner;
    }

    Ticket[TOTAL_TICKETS] public tickets;
    
    constructor(){
       for(uint256 i = 0; i <= TOTAL_TICKETS ; i++){
        tickets[i].id = i+1;
        tickets[i].price = 1e17;
        tickets[i].owner = address(0x0);
    }
    }

    function buyTicket(uint256 _ID) external payable {

        require(_ID < TOTAL_TICKETS);
        require(_ID > 0);
        require(tickets[_ID-1].owner ==  address(0x0) );
        require(msg.value>tickets[_ID-1].price);

        tickets[_ID-1].owner = msg.sender;

        
    }
}
