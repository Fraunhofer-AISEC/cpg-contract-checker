
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/Counter.sol";

contract CounterTest is Test {
    Recovery public recover;

    function setUp() public {
        recover = new Recovery();
    }

    function test_destroy(address _to) public {
        recover.destroy(_to);
    }
}
