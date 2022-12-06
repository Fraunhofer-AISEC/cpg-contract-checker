contract X {
    uint x;
    uint y;

    function a(uint u) public {
        x = u;
    }

    function b(uint v) public {
        y = v;
    }

    function t(uint v) public {
        a(v);
        b(v);
    }

    function () {
        t(1);
    }
}
