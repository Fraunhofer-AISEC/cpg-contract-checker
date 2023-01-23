
pragma solidity ^0.4.0;

contract StorageTest {
    mapping(address => uint256) public storedData;

    function addDataToMapping(address account, uint256 amount) public {
        storedData[account] = amount;
    }
}
