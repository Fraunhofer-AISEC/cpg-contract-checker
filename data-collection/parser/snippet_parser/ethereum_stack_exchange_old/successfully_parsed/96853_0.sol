pragma solidity ^0.8.0;

import "./MyAwesomeMathLib.sol";

contract Consumer {
    function doAvg(uint256 x, uint256 y) external pure returns (uint256 result) {
        result = MyAwesomeMathLib.avg(x, y);
    }
}
