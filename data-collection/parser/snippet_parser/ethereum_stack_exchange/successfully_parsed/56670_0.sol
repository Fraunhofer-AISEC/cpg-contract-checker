pragma solidity ^0.4.23;

contract Lottery {

struct Ticket {
    uint id;
    address name;
    uint winCount;
}

uint public winFirstPercent = 60;
uint public prizeMoney = 0;
address public winner;
uint public priz;

uint public lastWinNumber = 0;

uint public ticketCount = 10;
uint public ticketPrice = 1 ether;

address public walletMoney = 0xca35b7d915458ef540ade6068dfe2f44e8fa733c; 


mapping (uint => Ticket) public tickets;

event buyTicket (uint ticketNum, address adrr);
event winAddress (uint ticketWin, address winAddress, uint priz, uint prizeMoney);

constructor () public {
    clearTickets();
}

function clearTickets() public {
    for (uint i = 0; i < ticketCount; i++){
        tickets[i] = Ticket(i,0,0);
    }
}

function buyTickets (uint _ticketNum) public payable returns (bool success) {
    require ((_ticketNum > 0) && (_ticketNum < ticketCount));
    require (tickets[_ticketNum].name == 0);
    require (msg.value == ticketPrice);
    walletMoney.transfer(msg.value);
    prizeMoney += msg.value;
    tickets[_ticketNum] = Ticket(_ticketNum, msg.sender, 0);
    emit buyTicket(_ticketNum, msg.sender);
    return true;
}

function playGame () public {
    
    lastWinNumber = 1;
    if (tickets[lastWinNumber].name != 0) {
        winner = tickets[lastWinNumber].name;
        priz = prizeMoney*winFirstPercent/100;
        winner.transfer(priz);
    }
    emit winAddress(lastWinNumber, winner, priz, prizeMoney);
}
}
