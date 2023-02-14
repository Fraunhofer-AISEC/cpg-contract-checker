
pragma solidity ^0.7.4;

import "Base.sol";

contract Test is Base {
    function getnum(uint256 _number) external view returns (uint256) {
        return _number.add(_number);
    }
}
