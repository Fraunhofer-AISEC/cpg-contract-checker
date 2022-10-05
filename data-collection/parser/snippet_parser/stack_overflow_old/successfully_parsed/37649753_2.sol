contract A
{
    uint public foo;

    function A(uint _foo)
    {
        foo = _foo;
    }
}

contract B
{
    uint bar;

    function B()
    {
        A a = new A(42);
        bar = a.foo();
    }
}
