contract C {
    address a;
    constructor(address _a) public {
        a = _a;
    }

    function get() external view returns (address) {
        return a;
    }
}
