

pragma solidity >=0.7.0 <0.9.0;

contract helper {
    function toStr(bytes memory byts) public pure returns (string memory) {
        return string(byts);
    }

    function toBytes(string memory byts) public pure returns (bytes memory) {
        return bytes(byts);
    }
}
