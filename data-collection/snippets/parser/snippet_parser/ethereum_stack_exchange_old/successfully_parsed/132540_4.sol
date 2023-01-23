
pragma solidity >=0.8.0;

import "./ICRUD.sol";

contract verifyData {

    ICRUD public crud;

    constructor(address _crudAddress) {
        crud = ICRUD(_crudAddress);
    }

    function read(uint index) external view returns (uint, bytes32, string memory) {
        return (crud.readAllData(index));
    }
}
