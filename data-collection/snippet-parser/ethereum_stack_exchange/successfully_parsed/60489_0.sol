pragma solidity 0.4.24;

contract MyContract {
    uint[] public array;

    constructor() public {
        array.push(1);
        array.push(2);
        array.push(3);
    }

    function getArray() public view returns(uint[]) {
        return array;
    }
}
