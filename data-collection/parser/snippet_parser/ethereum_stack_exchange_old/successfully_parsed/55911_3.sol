pragma solidity ^0.4.24;

contract Test {

    mapping(uint256 => uint256) contributors;

    function distribute() public returns (uint256) {
        contributors[0] = 10;
        uint256 val = contributors[0];
        return val / 20 * 10;
    }
}
