contract B{
    uint public n;

    function test2() public { n = n + 1; }
}

contract A is B{
    uint public n;
}
