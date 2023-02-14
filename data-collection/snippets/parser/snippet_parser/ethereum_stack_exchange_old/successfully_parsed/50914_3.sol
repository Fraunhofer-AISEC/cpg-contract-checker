pragma solidity ^0.5.0;

contract Test {
    function test(bytes32 data) external pure returns (address) {
        return address(uint160(uint256(data)));
    }
}
