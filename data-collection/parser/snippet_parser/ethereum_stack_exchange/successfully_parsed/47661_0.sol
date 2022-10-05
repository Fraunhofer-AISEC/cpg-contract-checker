pragma solidity ^0.4.23;
pragma experimental ABIEncoderV2;



contract simpleBet {

    struct Bettor {
        address wallet;
        uint betAmount;
        uint outcome;
        uint bettingTime;
    }

    struct bettingEvent {
        string name;
        string uid;
        uint startTime;
        uint endTime;
        Bettor[] bettors;
    }

    bettingEvent[] public bettingEvents;

    constructor() public {
    }


    function createBettingEvent(string _name, string _uid, uint _startTime, uint _endTime) public {

        bettingEvent memory _bettingEvent;
        _bettingEvent.name = _name;
        _bettingEvent.uid = _uid;
        _bettingEvent.startTime = _startTime;
        _bettingEvent.endTime = _endTime;
        _bettingEvent.bettors.push(Bettor(0,0,0,0));


        bettingEvents.push(_bettingEvent);
    }

}
