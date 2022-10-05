contract C {
    uint a = 1;
    uint b;
    uint c = b + 1;

    constructor() {
        b = 2;
    }

    function get() public view returns (uint, uint, uint) {
        return (a, b, c);
    }
}
