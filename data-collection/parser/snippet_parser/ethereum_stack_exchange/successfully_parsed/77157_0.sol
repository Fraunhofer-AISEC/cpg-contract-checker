pragma solidity ^0.5.0;

contract C1 {
    int public x = 1;

    function setX(int _x) public {
        x = _x;
    }

    function getX() public view returns (int y) {
        return x;
    }
}
