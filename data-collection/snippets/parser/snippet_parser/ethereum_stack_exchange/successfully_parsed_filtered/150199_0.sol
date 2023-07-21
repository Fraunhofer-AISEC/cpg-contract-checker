pragma solidity 0.8.20;

contract Test {

    event Value(uint256 value);

    event NameDoesntMatter(bytes32 indexed topic0, uint256 value) anonymous;

    function test() external {
        emit Value(123);
        emit NameDoesntMatter(keccak256(bytes("Value(uint256)")), 123);
    }
}
