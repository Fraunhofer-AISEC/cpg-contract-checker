

contract Bytes {
    function getLast32Bytes(bytes memory input) public returns (bytes32 half) {
        require(input.length == 64, "input must be exactly 64 bytes");

        assembly {
            half := mload(add(input, 64))
        }
    }

    function getFirst32Bytes(bytes memory input) public returns (bytes32 half) {
        require(input.length == 64, "input must be exactly 64 bytes");

        assembly {
            half := mload(add(input, 32))
        }
    }
}
