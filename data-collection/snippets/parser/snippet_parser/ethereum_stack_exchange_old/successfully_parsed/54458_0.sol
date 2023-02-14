pragma solidity ^0.4.24;

contract TestCalls {

    uint public lastMsgDataLength;
    uint public lastMsgValue;

    modifier setMsgFields {
        lastMsgDataLength = msg.data.length;
        lastMsgValue = msg.value;
        _;
    }

    constructor() setMsgFields public {
    }
}
