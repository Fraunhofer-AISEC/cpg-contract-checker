contract b {

        bool p;

    mapping(uint => bool) public t;

    function setValue() {
        bool b = t[1];
        b = true;
    }
    function checkValue() returns (bool) {
        return t[1];
    }
}
