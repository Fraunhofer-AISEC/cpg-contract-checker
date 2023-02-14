contract C {
    uint someVariable;
    uint[] data;

    function f() {
        uint[] x = data;
        x.push(2);
    }
}

OR

contract C {
    uint someVariable;
    uint[] data;

    function f() {
        uint[] memory x = new uint[](1);
        x[0] = 2;
        data = x;
    }
}
