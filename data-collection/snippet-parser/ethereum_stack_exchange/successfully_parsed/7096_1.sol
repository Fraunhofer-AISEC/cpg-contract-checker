pragma solidity ^0.4.4;

contract myContract {

    struct myStruct{
        bytes32 name;
        bool active;
        uint[] changes;
    }

    myStruct[2] myStr;
    uint[] steps;

    event activatedEvent(uint time);

    function myContract() {
        myStr[0] = myStruct('foo', true, steps);
        myStr[1] = myStruct('bar', false, steps);
    }

    function activate(){
        myStruct ms = myStr[0]; 
        ms.changes.push(now);
        activatedEvent(now);
    }
}
