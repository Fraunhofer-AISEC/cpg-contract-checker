pragma solidity ^0.5.0;

contract Test {
    function testWrite() public {}

    function get() public pure returns (bytes memory) {
       return bytes('yo');
    }
}
