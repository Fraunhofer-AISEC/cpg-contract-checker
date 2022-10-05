function createBettingEvent(string _name, string _uid, uint _startTime, uint _endTime) public {
    bettingEvents.length += 1;
    bettingEvent storage _bettingEvent = bettingEvents[bettingEvents.length - 1];
    _bettingEvent.name = _name;
    _bettingEvent.uid = _uid;
    _bettingEvent.startTime = _startTime;
    _bettingEvent.endTime = _endTime;
    _bettingEvent.bettors.push(Bettor(0, 0, 0, 0));
}
