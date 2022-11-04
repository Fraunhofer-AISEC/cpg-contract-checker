contract A {
    event E();

    function a() public {
        emit E();
    }
}

contract B {
    A private a;

    function b() public {
        a();
    }
}
