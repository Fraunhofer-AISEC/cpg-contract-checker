contract SimpleStorage {
    uint public data;

    function set(uint x) public {
        data = x;
    }
}
