contract SaveMyNumber {

    uint storedNumber;

    function set(uint x) public {
        storedNumber = x;
    }
}
