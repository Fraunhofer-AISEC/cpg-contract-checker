pragma solidity 0.5.2;

contract Users {

    mapping(address=>bool) public isUser;
    address[] public users;

    function register() public {
        require(!isUser[msg.sender]);
        isUser[msg.sender] = true;
        users.push(msg.sender);
    }
}

contract Events {

    uint eventCount;

    struct EventStruct {
        mapping(address=>bool) isAttendee;
        address[] attendees;
        bytes32 metadata;
    }

    mapping(uint=>EventStruct) public events;

    function createEvent(bytes32 metaData) public {
        events[eventCount].metadata = metaData;
        eventCount++;
    }

    function reserveAttenance(uint eventId) public {
        require(eventId < eventCount);
        EventStruct storage e = events[eventId];
        require(!e.isAttendee[msg.sender]);
        e.isAttendee[msg.sender] = true;
        e.attendees.push(msg.sender);
    }
}
