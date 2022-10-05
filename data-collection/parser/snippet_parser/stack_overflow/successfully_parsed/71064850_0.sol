

pragma solidity >=0.6.0;

import "./simplestorage.sol";
``
contract StorageFactory {
function createsimplestoragecontract() public {
simplestorage _simplestorage = new simplestorage();
}

}
