pragma solidity ^0.4.24;

contract GetYourSig {
    function f() public pure returns (bytes4) {
        return msg.sig;
    }
}
