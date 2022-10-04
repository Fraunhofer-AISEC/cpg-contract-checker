
pragma solidity >=0.8.0;

interface ICRUD {
    function readAllData(uint index) external view returns (uint, bytes32, string memory);

}
