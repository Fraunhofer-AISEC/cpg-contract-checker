contract B {
    function B() public {emit PrintB();}
    event PrintB();
}

contract C {
    function C() public {emit PrintC();}
    event PrintC();
}

contract D is B, C {
    function D() C() B() {}
}

contract E is B, C {
    function E() B() C() {}
}
