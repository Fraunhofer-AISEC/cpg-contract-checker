contract A {
    uint public n;
    function foo () public returns (uint) {
        n = 1234;
        return n;
    }
}

contract B {
    uint public n;
    function foo () public returns (uint) {
        n = 7777;
        return n;
    }
}

contract C {
    function bar(uint n) public returns (uint) {
        A a;
        if (n == 1) {
            a = new A();
        } else {
            a = A(address(new B()));
        }
        a.foo();
        return a.n();
    }
}
