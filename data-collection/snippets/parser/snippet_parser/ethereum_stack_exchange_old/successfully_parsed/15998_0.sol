pragma solidity ^0.4.0;

contract EventManager {

    struct Event {
        bytes32 name;
        uint time;
    }

    uint totalEvents;

    mapping(uint => Event) EventList;

    event EventAdded(address indexed _senderAddress, uint _eventId);

    function addEvent(bytes32 _name, uint _time) returns(uint eventId) {
        eventId = totalEvents++;
        EventList[eventId] = Event(_name, _time);
        EventAdded(msg.sender, eventId);
    }

    function listEvents(uint _start, uint _count) constant returns(uint[] eventIds, bytes32[] eventNames, uint[] eventTimes) {

        uint maxIters = _count;
        if( (_start+_count) > totalEvents) {
            maxIters = totalEvents - _start;
        }

        eventIds = new uint[](maxIters);
        eventNames = new bytes32[](maxIters);
        eventTimes = new uint[](maxIters);

        for(uint i=0;i<maxIters;i++) {
            uint eventId = _start + i;

            Event memory e = EventList[eventId];
            eventIds[i] = eventId;
            eventNames[i] = e.name;
            eventTimes[i] = e.time;
        }
    }
}
