
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

    
    events[eventId] = Event({
        eventId: eventId,
        startTime: startTime,
        endTime: endTime,
        result: result,
        totalBet: 0,
        numBets: 0,
        bets: mapping(bytes32 => uint256)new(0)
    });

    return true;
}
