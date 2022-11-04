
pragma solidity ^0.8.3;

library math{
    function max(uint x, uint y) public pure returns (uint)
        {
            return x >= y ? x : y;
        }
}


contract test{
    function testMax(uint x,uint y) external pure returns (uint) {
        return math.max(x,y);
    }
}
