pragma solidity ^0.4.24;

library TestLibrary {
    function setMyArray(uint[] storage value1) internal {
        value1[0] = 100;
    }
}

contract Test {
    uint[] public arr;

    constructor() public {
        arr = [1];
    }

    function setMe() public {
        TestLibrary.setMyArray(arr);
    }
}
