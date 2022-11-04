pragma solidity ^0.4.25;

import "./StringsLib.sol";

contract LibraryClient {
    using StringsLib for bytes32;

    function doSomething(bytes32 x) public constant returns (string) {
        return x.toString();
    }
}
