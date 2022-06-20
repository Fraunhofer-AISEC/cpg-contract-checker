
pragma solidity ^0.4.18;

contract modifierTest {
    uint public modState1;
    uint public modState2;
    uint public modState3;

    modifier modA() {
        modState1 = modState1 + 1;
        _;
    }

    modifier modB() {
        modState2 = modState2 + 1;
        _;
        modState2 = modState2 + 1;
        _;
    }

    function func() public modA modB {
        modState3 = modState3 + 1;
    }
}
