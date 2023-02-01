pragma solidity 0.5.4;

contract Test {
    bytes32 public constant bytes32_ = "Hello World!";
    bytes32 public constant anotherBytes32 = "Hello World!";

    function areTheyEqual() public pure returns(bool) {
        return (bytes32_ == anotherBytes32);
    }
}
