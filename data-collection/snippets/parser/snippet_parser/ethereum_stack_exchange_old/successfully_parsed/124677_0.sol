

pragma solidity ^0.8.7;

contract ConfidentialStorage {
    string confidential;

    function setConfidential(string memory str) external {
        confidential = str;
    }

    function checkCharAt(uint8 i, string memory str) external view returns(bool) {
        bytes memory arrConfidential = bytes(confidential);
        require(arrConfidential.length > i, "Out of bounds");
        return arrConfidential[i] == bytes(str)[0];
    }
}
