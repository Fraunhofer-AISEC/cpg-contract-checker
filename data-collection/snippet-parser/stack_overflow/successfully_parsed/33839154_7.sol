
pragma solidity ^0.8.9;

contract CallDataExample {
    uint[] public values;

    function doSomething() public
    {
        values.push(5);
        values.push(10);

        modifyArray(values);
    }

    function modifyArray(uint[] calldata arrayToModify) pure private {
        arrayToModify[0] = 8888; 
    }
}
