
pragma solidity ^0.6.0;

import {King} from "../src/King.sol";
import "forge-std/Test.sol";

contract KingTest is Test {
    function setUp() public {}

    function testExample() public {
        King king = new King();
        address(king).transfer(1 ether);
    }
}
