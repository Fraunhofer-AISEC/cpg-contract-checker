
pragma solidity 0.8.10;

contract A {
    function foo(bytes memory data) public pure returns (string memory, uint256, bytes32) {
        (string memory aString, uint256 aUint, bytes32 aBytes32) = abi.decode(
            data,
            (string, uint256, bytes32)
        );
        return (aString, aUint, aBytes32);
    }
}
