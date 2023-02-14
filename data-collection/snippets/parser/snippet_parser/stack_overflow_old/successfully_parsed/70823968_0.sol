
pragma solidity ^0.6.0;

import "./simplestorage.sol";

contract StorageFactory {

    simplestorage[] public SimpleStorageArray;

    function createsimplestorageContract() public {
        simplestorage SimpleStorage = new simplestorage();

        SimpleStorageArray.push(SimpleStorage);
    }
}
