
pragma solidity ^0.8.0;

contract SmartContract {

    bytes32[] public items;

    function addItem(bytes32 item) external {
        items.push(item);
    }

    function getAllItems() external view returns(bytes32[] memory) {
        return items;
    }

}
