contract MyContract {
    event LogString(string str);
    event LogAddress(address addr);

    function logData(string str) {
        LogString(str);
    }
    function logData(address addr) {
        LogAddress(addr);
    }
}
