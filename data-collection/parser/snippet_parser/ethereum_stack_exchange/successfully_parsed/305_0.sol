
contract C {
    uint someVariable;
    uint[] data;

    function f() {
        uint[] x;
        x.push(2);
        data = x;
    }
}
