contract C {

    struct A {
        uint256 a;
        uint256 b;
    }

    struct B {
        A ax;
        uint256 c;
    }

    struct C {
        string name;
        B[] bs;
    }

    function init() {
        C memory c;
        B memory b;
        A memory a;

        a.a = 10;
        a.b = 20;

        b.ax = a;
        b.c = 30;

        c.name = "Test test test";
        c.bs[0] = b;
    }
}
