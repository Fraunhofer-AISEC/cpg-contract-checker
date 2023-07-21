pragma solidity ^0.8.13;

error MyError();

abstract contract A
{
    function f1() public pure virtual returns(bool);
    function f2() public pure virtual returns(bool)
    {
        bool result = f1();
        return result;
    }
}
contract B is A
{
    function f1() public pure override returns (bool)
    {
        revert MyError();
    }
}
contract C is A
{
    function f1() public pure override returns (bool)
    {
        return true;
    }
}
