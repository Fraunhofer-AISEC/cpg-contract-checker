pragma solidity ^0.8.4;

import "./LibA.sol";

contract SampleContract {

    function doSomething(uint8 _index) public pure returns (uint8) {
        return LibA.getArray()[_index];
    }
}
