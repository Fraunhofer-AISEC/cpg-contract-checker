
pragma solidity ^0.8.0;

contract Test {
    function getFee() public pure returns(uint256) {
        uint256 _fee = 0.0005 * 10e18;
        return _fee;
    }
}
