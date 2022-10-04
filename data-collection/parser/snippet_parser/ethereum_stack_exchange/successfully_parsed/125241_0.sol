
pragma solidity ^0.8.4;

interface IFoo {
    struct Point {
        uint x;
        uint y;
    }
    function foo (address) external view returns (Point memory);
}
