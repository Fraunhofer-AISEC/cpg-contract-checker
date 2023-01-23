
contract A {
    string log;

    function getLog () returns(string) {
        return log;
    }

    function test () {
        log = "test";
    }
}


contract IA {
    function test () {}
}


contract B {
    IA a;

    function B (IA _a) {
        a = IA(_a);
    }

    function play () {
        a.test();
    }
}
