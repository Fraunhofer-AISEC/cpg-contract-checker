pragma solidity ^0.4.18;
import './ITest.sol';

contract Test is ITest {
    uint256 public x;

    function Test(uint256 _x) public {
        x  = _x;
    }
}
