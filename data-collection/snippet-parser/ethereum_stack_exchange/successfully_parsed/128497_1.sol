pragma solidity ^0.8.0;

import "@openzeppelin/contracts/utils/math/SafeMath.sol";

contract Example {

    using SafeMath for uint256;

    function withAttachedFunction() public pure returns (uint256) {
        uint256 variable = 1;

        return variable.sub(1);
    }

    function withoutAttachedFunction() public pure returns (uint256) {
        uint256 variable = 1;

        return SafeMath.sub(variable, 1);
    }
}
