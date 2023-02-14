
pragma solidity ^0.8.17;

contract CallTooDeep {
    function test() public {
        address(this).test();
    }
}
