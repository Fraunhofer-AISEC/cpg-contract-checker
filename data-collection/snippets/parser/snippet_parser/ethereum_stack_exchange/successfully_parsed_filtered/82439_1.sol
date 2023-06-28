function testStuff(
    uint256 x1, 
    uint256 x2, 
    uint256 x3 
    ) public returns (bytes memory b) 
{
    b = new bytes(40);
    assembly 
    { 
        mstore(add(b, 40), x1)
        mstore(add(b, 36), x2)
        mstore(add(b, 32), x3)
    }
}
