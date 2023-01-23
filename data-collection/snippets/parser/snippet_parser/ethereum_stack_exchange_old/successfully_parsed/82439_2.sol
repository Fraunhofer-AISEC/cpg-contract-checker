function testStuff(
    uint256 x1, 
    uint256 x2, 
    uint256 x3 
    ) public returns (bytes memory b) 
{
    b = new bytes(40);
    assembly 
    { 
        mstore(add(b, 12), x1)
        mstore(add(b, 8), x2)
        mstore(add(b, 4), x3)
        mstore(b, 12)
    }
}
