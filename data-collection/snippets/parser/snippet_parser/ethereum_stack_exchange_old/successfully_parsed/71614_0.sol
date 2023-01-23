pragma solidity ^0.5.8;

library lib {

    function isZero (address _address) public pure returns (bool) {
        return _address == address(0x0);
    }
}
