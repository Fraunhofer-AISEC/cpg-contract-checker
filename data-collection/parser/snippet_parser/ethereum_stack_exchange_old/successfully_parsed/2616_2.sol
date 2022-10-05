contract SimpleStorage {
    bytes storedData;
    function set(bytes x) {
        storedData = x;
    }
    function get() constant returns (bytes retVal) {
        return storedData;
    }
}
