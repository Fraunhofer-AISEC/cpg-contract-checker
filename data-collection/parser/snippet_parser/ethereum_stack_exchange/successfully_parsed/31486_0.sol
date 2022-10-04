pragma solidity ^0.4.18;

contract Test {
    address[] array;
    address[] helper;

    function Test() public {
        array.push(0x0);
        array.push(0x0);
        array.push(0x0);
        array.push(0x0);
    }

    function getSize() public view returns (uint256) {
        return array.length;
    }

    function clear() public {
        array = helper;
    } 
}
