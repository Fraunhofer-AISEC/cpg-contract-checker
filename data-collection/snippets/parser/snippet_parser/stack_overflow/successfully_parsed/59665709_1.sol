pragma solidity >=0.6.0;
pragma experimental ABIEncoderV2;


contract SomeContract {
    string[] public employees;

    function getAllEmployees() public view returns (string[] memory) {
        return employees;
    }
}
