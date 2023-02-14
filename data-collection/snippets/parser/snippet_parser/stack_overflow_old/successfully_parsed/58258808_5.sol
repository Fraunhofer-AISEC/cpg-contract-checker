contract MyContract {
    string value;

    function get() public view returns (string calldata) {
        return value;
    }

    function set(string calldata _value) public {
        value = _value;
    }

    constructor() public {
        value = "myValue";
    }
}
