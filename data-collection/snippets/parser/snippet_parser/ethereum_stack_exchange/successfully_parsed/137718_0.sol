
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/Counter.sol";

contract CounterTest is Test {
    Counter public counter;

    function setUp() public {
        counter = new Counter();
        counter.setNumber(10);
    }

    function testIncrement() public {
        counter.increment();
        assertEq(counter.number(), 11);
    }

    function testSetNumber(uint256 x) public {
        counter.setNumber(x);
        assertEq(counter.number(), x);
    }

    function testDecrement(uint256 num) public {
        vm.assume(num < counter.getNumber());
        uint256 contractNum = counter.getNumber();
        counter.decrement(num);
        assertEq(contractNum - num, counter.getNumber());
    }

    function testFailDecrement(uint256 num) public {
        vm.assume(num > counter.getNumber());
        uint256 contractNum = counter.getNumber();
        counter.decrement(num);
        assertEq(contractNum - num, counter.getNumber());
    }

    function testCannotDecrementLargerNumbers(uint256 num) public {
        vm.assume(num > counter.getNumber());
        uint256 contractNum = counter.getNumber();
        vm.expectRevert(num > counter.getNumber());
        counter.decrement(num);
    }
}
