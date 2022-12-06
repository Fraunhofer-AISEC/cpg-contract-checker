

pragma solidity ^0.4.0;

contract C {
    bytes s = "Storage";

    function f() public view {
        bytes memory a = bytes.concat(s, "Lit");
    }
}
