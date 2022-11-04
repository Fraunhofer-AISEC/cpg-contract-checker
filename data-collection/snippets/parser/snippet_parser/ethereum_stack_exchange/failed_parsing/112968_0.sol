pragma solidity ^0.8.4;

library LibA {
    function getArray() public pure returns (uint8[] memory) {
        uint8[] memory arr;
        arr[0] = 100;
        ...

        return arr;
    }
}
