
pragma solidity 0.8.11;

interface SampleInterface {
    struct Point {
        uint256 x;
        uint256 y;
    }
    function setPoint(Point memory point) external;
    function getPoint() external view returns(Point memory);
}
contract Operator {
    address sample;
    constructor(address _sample) {
        sample = _sample;
    }

    function setPoint(Point memory point) external {
        SampleInterface(sample).setPoint(point);
    }

    function getPoint() external view returns(Point memory) {
        return SampleInterface(sample).getPoint();
    }
}
