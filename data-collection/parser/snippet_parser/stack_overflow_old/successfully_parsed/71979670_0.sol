

pragma solidity 0.8.11;

interface SampleInterface {
        struct Point {
                uint256 x;
                uint256 y;
        }
        function setPoint(Point memory) external;
        function getPoint() external view returns(Point memory);
}

contract Sample is SampleInterface {
    Point point;
    function setPoint(Point memory _point) external {
        point = _point;
    }

    function getPoint() external view returns(Point memory) {
        return point;
    }
}
