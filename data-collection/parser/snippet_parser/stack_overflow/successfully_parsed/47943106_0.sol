contract Test {
    event Log(address addr);

    function logMe () public {
        Log(msg.sender);
    }
}
