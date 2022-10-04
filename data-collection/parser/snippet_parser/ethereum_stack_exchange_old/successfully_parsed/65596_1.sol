pragma solidity ^0.4.24;
import './User.sol';

contract Event is User{

    struct EventStruct {
        uint average;
        uint quantity;
    }

    mapping(uint=>EventStruct) events;
    uint eventsCounter;
}
