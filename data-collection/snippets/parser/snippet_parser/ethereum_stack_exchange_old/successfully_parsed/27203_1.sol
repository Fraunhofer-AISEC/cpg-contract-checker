contract A {
    function createAndPassAmount(uint arg, uint amount) payable {
        B newD = (new B).value(amount)(arg);
    }
}
