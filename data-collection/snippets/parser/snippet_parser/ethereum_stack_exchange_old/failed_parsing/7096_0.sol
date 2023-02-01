contract myContract {

    struct myStruct{
        bytes32 name;
        bool active;
        uint[] changes;
    }

    myStruct[2] myStr;
    uint[] steps;

    Event activatedEvent(uint time);

    function myContract{
        myStr[0] = packStruct('foo', true, steps);
        myStr[1] = packStruct('bar', false, steps);
    }

    function activate(){
        myStruct ms = myStr[0]; 
        ms.changes.push(now);
        activatedEvent(now);
    }
}
