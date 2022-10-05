contract X {}

contract XFactory {
    function createX() returns (X) {
        return new X();
    }
}

contract Main {
    XFactory xFactory;
    ...
    Main(XFactory _xFactory) {
        xFactory = _xFactory;
    }
    ...
    function someMethod() {
        X x = xFactory.create();
    }
    ...
}
