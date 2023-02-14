
function createEvent(
    bytes32 eventId,
    uint256 startTime,
    uint256 endTime,
    bytes32 result
)
    public
    onlyOwner
    returns (bool success)
{
    require(events[eventId].totalBet == 0, "Event already exists");

    
    Event storage event = events[eventId];

    event.eventId = eventId;
    event.startTime = startTime;
    event.endTime = endTime;
    event.result = result;
    event.totalBet = 0; 
    event.numBets = 0;

    return true;
}
