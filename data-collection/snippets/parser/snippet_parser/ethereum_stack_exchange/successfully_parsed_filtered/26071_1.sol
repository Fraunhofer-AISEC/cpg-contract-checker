contract F {
    function () {}
}

contract N {}

contract Test {
    event Log(bool x);
    function TestF() {
        address f = address(new F());
        Log(f.call());
    }
    function TestN() {
        address n = address(new N());
        Log(n.call());
    }
}
