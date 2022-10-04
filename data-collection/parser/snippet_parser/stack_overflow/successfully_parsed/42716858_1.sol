pragma solidity ^0.8.0;

contract Test {
    string[] public row;

    function getRow() public view returns (string[] memory) {
        return row;
    }

    function pushToRow(string memory newValue) public {
        row.push(newValue);
    }
}
