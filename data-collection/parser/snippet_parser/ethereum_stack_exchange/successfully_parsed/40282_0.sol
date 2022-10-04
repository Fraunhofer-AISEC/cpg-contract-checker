contract SimpleContract {
    uint storedData;
    function set(uint x) public { storedData = x; }
    function get() public returns (uint) { return storedData; }
}
