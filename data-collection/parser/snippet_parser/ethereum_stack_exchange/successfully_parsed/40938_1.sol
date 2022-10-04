pragma solidity ^0.4.19;

import "browser/library.sol";

contract TestLibrary is IntExtended {

    function testIncrement(uint _base) returns (uint) {
        return IntExtended.increment(_base);
    }       
}
