pragma solidity 0.5.12;

contract Test {
    bytes32 public constant bytes32_1 = "Hello";
    bytes32 public constant bytes32_2 = "World!";

    bytes32 public constant anotherBytes32_1 = "Hello";
    bytes32 public constant anotherBytes32_2 = "World";

    function areTheyEqual() public pure returns(bool) {
        return keccak256(abi.encodePacked(bytes32_1, bytes32_2)) == 
               keccak256(abi.encodePacked(anotherBytes32_1, anotherBytes32_2));
    }
}
