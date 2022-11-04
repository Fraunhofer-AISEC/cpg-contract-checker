pragma solidity ^0.5.0;

contract Doubler {
    function execute(int a) public pure returns(int) {
        return a + a;
    }
}
