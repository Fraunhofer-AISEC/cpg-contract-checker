
pragma solidity ^0.8.17;

contract TestA {
    function callme(uint256 value, uint256 limit) public returns(uint256) {
        return TestB(msg.sender).callback(value, limit);
    }
}

contract TestB {
    function callback(uint256 value, uint256 limit) public returns(uint256) {
        if (value < limit) {
            return TestA(msg.sender).callme(value+1, limit);
        } else {
            return value;
        }
    }

    function attack(address testA, uint256 limit) public returns(uint256) {
        return TestA(testA).callme(0, limit);
    }
}
