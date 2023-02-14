
pragma solidity ^0.8.0;

contract Lottery {

constructor () {
    owner = msg.sender;
}

address[] public Players;
address private owner;

uint public ticketPrice;
uint public price;
uint public nonce;
uint public variations;
address payable winner;
bool hasTicketAnswer;

event Winner(address _winner);
event PriceSet(uint _setPrice);
event TicketBought();

function setTicketPrice(uint _ticketPrice) public {
    require(msg.sender == owner, "Only Owner...");
    ticketPrice = _ticketPrice;

    emit PriceSet(_ticketPrice);
}

function hasTicket(address _sender) private returns(bool) {
    hasTicketAnswer = false;
    for (uint i = 0; i < Players.length; i++) {
        if (Players[i] == _sender) hasTicketAnswer = true;
    }
    return hasTicketAnswer;
}

function buyTicket() external payable {
    require(ticketPrice > 0, "Price did not set, be patient...");
    require(hasTicket(msg.sender) == false, "You cannot have two tickets...");
    require(msg.sender.balance <= ticketPrice, "Insufficient funds...");
    payable(address(this)).transfer(ticketPrice);
    Players.push(address(msg.sender));
    price += msg.value;

    emit TicketBought();
}

function checkBalance() public view returns(uint) {
    return address(this).balance;
}

function rollTheDice() public payable {
    variations = Players.length;
    winner = payable(Players[uint(keccak256(abi.encodePacked(msg.sender, nonce, block.timestamp))) %  variations]);
    winner.transfer(price);

    emit Winner(winner);
}

receive () external payable  {

}

}

