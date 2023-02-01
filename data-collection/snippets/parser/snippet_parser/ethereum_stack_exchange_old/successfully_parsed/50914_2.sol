pragma solidity ^0.4.24;

contract Test {
    function test(bytes32 data) external pure returns (address) {
        return address(data);
    }
}
