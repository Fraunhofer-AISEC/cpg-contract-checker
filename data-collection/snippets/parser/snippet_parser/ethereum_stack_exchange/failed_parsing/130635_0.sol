
pragma solidity ^0.7.0;

import "./SimpleStorage.sol";

contract StroageFactory
{
    address[] public SimpleStorageArray;

    function createSimpleStorage() public
    {
        SimpleStorage _simpleStorage = new SimpleStorage();
