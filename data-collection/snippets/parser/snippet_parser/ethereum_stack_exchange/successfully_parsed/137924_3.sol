
pragma solidity ^0.8.17;

contract CallTooDeep {
    function test() public {
       CallTooDeep(address(this)).test();
    }
}
