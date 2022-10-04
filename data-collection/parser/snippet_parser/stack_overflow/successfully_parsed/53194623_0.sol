pragma solidity ^0.4.0;

contract HashRecord {
    string public hashValue;

function setHashValue(string newHashValue) public {
    hashValue = newHashValue;
}

function getHashValue() public view returns (string) {
    return hashValue;
}
}
