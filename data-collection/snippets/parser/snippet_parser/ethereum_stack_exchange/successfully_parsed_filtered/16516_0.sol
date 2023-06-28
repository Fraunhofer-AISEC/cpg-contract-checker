pragma solidity ^0.4.11;

contract base {
    uint public v;
    separate public mySep;

    function base() {
        mySep = new separate();
    }

    function f() {
        v = 1;
    }

    function sepCall() {
        mySep.doStuff();
    }
}

contract derived is base{
    function f() {
        v = 2;
        super.f();
    }
}

contract separate {
    derived myBase;

    function separate() {
        
        myBase = derived(msg.sender);
    }

    function doStuff() {
        myBase.f();
    }
}
