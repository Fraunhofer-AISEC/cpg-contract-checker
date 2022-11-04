contract C {
    
    function test(address addressOfD, bytes bb) {
        addressOfD.call(bb);
    }
}

contract D {
    event LogMsgData(bytes calldata);

    function() {
        LogMsgData(msg.data);
    }
}
