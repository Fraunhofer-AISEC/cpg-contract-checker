pragma solidity ^0.4.19;

import "library.sol";

contract TestLibrary {
    using IntExtended for uint;

    function testIncrement(uint _base) returns (uint) {
        return IntExtended.increment(_base);
    }
}
