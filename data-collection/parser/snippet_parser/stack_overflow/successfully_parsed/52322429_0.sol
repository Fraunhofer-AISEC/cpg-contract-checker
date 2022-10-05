contract A {
    B public b = new B();
}

contract B {
    function C() public pure returns (uint c)
    {
        c = 5;
    }
}
