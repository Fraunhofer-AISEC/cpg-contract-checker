contract b {

    struct Info {
        bool p;

    }
    mapping(uint => Info) public t;

    function setValue() {
        Info b = t[1];
        b.p = true;
    }
    function checkValue() returns (bool) {
        return t[1].p;
    }
}
