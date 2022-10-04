pragma solidity 0.5.11;

contract ModByZero {

    event LogSomeState(uint256 a, uint256 b);

    function doIt(uint256 a, uint256 b) public returns (uint256) {
        emit LogSomeState(a, b);
        return a % b;
    }
}
