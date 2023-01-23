function b(int x, int y) internal pure returns (int)
{
    return x * y;
}

function test1() external pure returns (int)
{
    
    function (int, int) internal pure returns (int) funcPtr;

    funcPtr = b;

    
    return funcPtr(4, 5);
}

function test2() external pure returns (int)
{
    
    function (int, int) internal pure returns (int) funcPtr;

    
    return funcPtr(4, 5);
}
