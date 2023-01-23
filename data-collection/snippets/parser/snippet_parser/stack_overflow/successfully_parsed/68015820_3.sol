pragma solidity ^0.8;

interface PointA {
    function retrieve() external view returns (uint256);
}

contract PointB {
    PointA pointA = PointA(0xd9145CCE52D386f254917e481eB44e9943F39138);

    function retrieve() public view returns (uint256) {
        uint256 retrieved = pointA.retrieve();
        return retrieved;
    }
}
