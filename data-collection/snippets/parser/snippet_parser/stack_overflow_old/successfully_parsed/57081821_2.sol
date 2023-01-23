pragma solidity ^0.5.10;

contract Test {
    mapping (address => bool) public whiteList;
    function addWhitelisted(address _address) public {
        whiteList[_address] = true;
    }
}
