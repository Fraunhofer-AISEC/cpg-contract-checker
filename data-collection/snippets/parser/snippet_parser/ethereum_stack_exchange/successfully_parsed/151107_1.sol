contract B is A
{
    function f1() public pure override returns (bool)
    {
        revert MyError();
    }
    function f2() public pure override returns (bool)
    {
        revert MyError();
    }
}
