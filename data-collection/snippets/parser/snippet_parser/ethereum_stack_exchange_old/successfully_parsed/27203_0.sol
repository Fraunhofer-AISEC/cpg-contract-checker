contract B {
    uint x;
    function B(uint a) payable {
        x = a;
    }
}


contract A {
    function createAndPassAmount(uint arg, uint amount) payable {
        B newD = new B.value(amount)(arg);
    }
}
