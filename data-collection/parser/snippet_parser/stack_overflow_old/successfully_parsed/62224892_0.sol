contract TestLog {
    bytes constant internal EMPTY_BYTES = "";
    event Logempty(bytes data);
    function Log() public {
        emit Logempty(EMPTY_BYTES);
    }
}
