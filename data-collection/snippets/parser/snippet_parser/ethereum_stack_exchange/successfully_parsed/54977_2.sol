pragma solidity ^0.4.24;
contract MultiReturns {
    struct MyThing {
        uint256 a;
        uint256 b;
        uint256 c;
    }

    function getPieces() internal pure returns(uint256 a, uint256 b, uint256 c) {
        return (123, 456, 789);
    }

    function doWork() public {
        (uint256 a, uint256 b, uint256 c) = getPieces();
        MyThing memory t = MyThing(a, b, c);
    }
}
