
pragma solidity ^0.8.9;

contract StorageMemory2 {
    uint[] public values;

    function doSomething() public
    {
        values.push(5);
        values.push(10);

        uint[] newArray = values; 
    }
}
