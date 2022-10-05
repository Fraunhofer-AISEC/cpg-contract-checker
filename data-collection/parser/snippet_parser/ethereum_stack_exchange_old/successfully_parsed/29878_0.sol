contract Event {

    uint32 currentMaxNumOfEvents=0;
    struct eventDetail{
    uint32  eventId;
    address  eventHost;
    string  eventName;
    uint32  noOfDaysToRegsiter;
    uint32  maxMembers;
    address[]  memberAddress;
    }
    mapping(uint32 => eventDetail) public events;
    function joinEvent(uint32 selectedEventId)public returns (uint32){
         for (uint i = 0; i<events[selectedEventId].memberAddress.length; i++) {
             assert(events[selectedEventId].memberAddress[i]==msg.sender);
        }
        require(selectedEventId>=0&&selectedEventId<=currentMaxNumOfEvents);
        require(events[selectedEventId].memberAddress.length < events[selectedEventId].maxMembers);
        events[selectedEventId].memberAddress.push(msg.sender);
        return selectedEventId;
    }
    function createEvent(string eventName,uint32 noOfdays,uint32 maxMembers) public returns (uint32){
        events[currentMaxNumOfEvents].eventId= currentMaxNumOfEvents;
        events[currentMaxNumOfEvents].eventHost =msg.sender;
        events[currentMaxNumOfEvents].eventName = eventName;
        events[currentMaxNumOfEvents].noOfDaysToRegsiter = noOfdays;
        events[currentMaxNumOfEvents].maxMembers = maxMembers;
        currentMaxNumOfEvents += 1;
        return events[currentMaxNumOfEvents].eventId;


    }
}
