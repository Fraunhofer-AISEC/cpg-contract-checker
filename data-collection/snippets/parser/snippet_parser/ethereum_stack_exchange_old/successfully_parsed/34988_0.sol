

bytes32 hashedSaltFromParticipant;
string saltFromParticipant;
unit256 participationTimestamp;
uint256 highestTicket;
uint256 ticketNr;
address addressOfParticipant;
address highestParticipant;

function buyLotteryTicket(_hashedSaltFromParticipant) payable
{
    participationTimestamp = now;
    hashedSaltFromParticipant = _hashedSaltFromParticipant; 
    addressOfParticipant = msg.sender;
}

function revealMyTicket(saltFromParticipant)
{
    require(keccak256(saltFromParticipant) == hashedSaltFromParticipant);
    tempTicketNr = keccak256(addressOfParticipant + saltFromParticipant + participationTimestamp);
    ticketNr = removeAllCharactersButDigits(tempTicketNr);
    if (ticketNr > highestTicket){
        highestTicket = ticketNr;
        highestParticipant = msg.sender;
    }
}




