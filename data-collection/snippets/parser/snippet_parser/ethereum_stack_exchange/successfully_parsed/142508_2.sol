function createEvent(
    bytes32 eventId,
    uint256 startTime,
    uint256 endTime,
    bytes32 result
)
    public
    returns (bool success)
{
    require(events[eventId].totalBet == 0, "Event already exists");

    
        Event storage temp= events[eventId];
        temp.eventId= eventId;
        temp.startTime=startTime;
        temp.endTime=endTime;
        temp.result= result;
        temp.totalBet=0;
        temp.numBets= 0;

    return true;
}
